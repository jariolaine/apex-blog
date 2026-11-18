"""Inspect the real FastMCP tool listing as an MCP client would."""

import asyncio

import pytest
from pydantic import TypeAdapter, ValidationError

pytest.importorskip('mcp', reason='MCP SDK is needed to test published tool schemas')

from automation.mcp.jobs import ALLOWED_TARGETS, capabilities  # noqa: E402
from automation.mcp.server import AutomationTarget, mcp  # noqa: E402


def _tools():
    return {tool.name: tool for tool in asyncio.run(mcp.list_tools())}


def _resolve_ref(schema: dict, prop: dict) -> dict:
    if '$ref' not in prop:
        return prop
    ref = prop['$ref']
    assert ref.startswith('#/$defs/')
    return schema['$defs'][ref.removeprefix('#/$defs/')]


def test_mcp_tool_discovery_has_descriptions():
    tools = _tools()
    assert set(tools) == {
        'automation_capabilities', 'automation_start',
        'automation_logs', 'automation_result', 'automation_list',
        'automation_cancel',
    }
    for name, tool in tools.items():
        assert tool.description and len(tool.description) > 60, name
        for arg_name, prop in tool.inputSchema.get('properties', {}).items():
            assert prop.get('description'), (name, arg_name)


def test_input_schema_enum_and_runtime_allowlist_match():
    tools = _tools()
    schema = tools['automation_start'].inputSchema
    assert set(schema['properties']) == {'target', 'wait_seconds'}
    assert set(schema['required']) == {'target'}
    wait = schema['properties']['wait_seconds']
    assert wait['minimum'] == 0
    assert wait['maximum'] == 60
    assert wait['default'] == 30
    assert wait.get('description')
    target_schema = _resolve_ref(schema, schema['properties']['target'])
    assert set(target_schema['enum']) == ALLOWED_TARGETS
    assert {item.value for item in AutomationTarget} == ALLOWED_TARGETS
    assert TypeAdapter(AutomationTarget).validate_python('lint').value == 'lint'
    for invalid in ('build', 'lint OBJECTS=NO', 'production'):
        with pytest.raises(ValidationError):
            TypeAdapter(AutomationTarget).validate_python(invalid)


def test_discovery_and_schema_share_targets():
    discovered = capabilities()
    enum_values = {item.value for item in AutomationTarget}
    assert {entry['name'] for entry in discovered['targets']} == enum_values
    assert discovered['mcp_accepts_make_variables'] is False
    assert discovered['authorization_enforced_by_mcp'] is False


def test_boundaries_are_in_published_input_schema():
    tools = _tools()
    log_schema = tools['automation_logs'].inputSchema
    props = log_schema['properties']
    assert props['offset']['minimum'] == 0
    assert props['max_bytes']['minimum'] == 1
    assert props['max_bytes']['maximum'] == 16384
    assert props['max_bytes']['default'] == 8192
    assert set(log_schema['required']) == {'job_id'}
    assert props['sqlcl_file']['default'] is None
    assert any(part.get('type') == 'string' and part.get('minLength') == 1
               for part in props['sqlcl_file']['anyOf'])
    result_schema = tools['automation_result'].inputSchema
    assert set(result_schema['required']) == {'job_id'}
    timeout = result_schema['properties']['timeout_seconds']
    assert timeout['minimum'] == 0
    assert timeout['maximum'] == 300
    assert timeout['default'] == 120
    assert 'automation_status' not in tools
    assert 'automation_wait' not in tools
    assert 'automation_sqlcl_files' not in tools
    assert 'automation_sqlcl_log' not in tools
    limit = tools['automation_list'].inputSchema['properties']['limit']
    assert limit['minimum'] == 1
    assert limit['maximum'] == 50
    assert limit['default'] == 20
