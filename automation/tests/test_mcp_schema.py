"""Verify the metadata Cline receives from MCP tools/list (no DB access)."""

import unittest

try:
    from automation.mcp.server import mcp
except ModuleNotFoundError as exc:
    if exc.name != 'mcp':
        raise
    mcp = None


@unittest.skipIf(mcp is None, 'Optional MCP SDK not installed; run inside automation container')
class MCPToolSchemaTests(unittest.IsolatedAsyncioTestCase):
    async def test_all_tool_arguments_have_descriptions(self):
        # This is the actual MCP tool listing, not annotations inspected in Python.
        tools = await mcp.list_tools()
        names = {tool.name for tool in tools}
        self.assertEqual(names, {
            'automation_capabilities', 'automation_start', 'automation_logs',
            'automation_result', 'automation_list', 'automation_cancel',
        })
        for tool in tools:
            with self.subTest(tool=tool.name):
                self.assertTrue(tool.description)
                properties = tool.inputSchema['properties']
                if tool.name != 'automation_capabilities':
                    self.assertTrue(properties)
                for name, property_schema in properties.items():
                    with self.subTest(parameter=name):
                        self.assertTrue(property_schema.get('description'),
                                        f'{tool.name}.{name} has no inputSchema description')

    async def test_log_paging_defaults_and_bounds_are_in_schema(self):
        tools = {tool.name: tool for tool in await mcp.list_tools()}
        for tool_name in ('automation_logs',):
            with self.subTest(tool=tool_name):
                schema = tools[tool_name].inputSchema
                props = schema['properties']
                self.assertEqual(props['offset']['default'], 0)
                self.assertEqual(props['offset']['minimum'], 0)
                self.assertEqual(props['max_bytes']['default'], 8192)
                self.assertEqual(props['max_bytes']['minimum'], 1)
                self.assertEqual(props['max_bytes']['maximum'], 16384)
                self.assertNotIn('offset', schema.get('required', []))
                self.assertNotIn('max_bytes', schema.get('required', []))
        result_schema = tools['automation_result'].inputSchema
        self.assertEqual(result_schema['properties']['timeout_seconds']['default'], 120)
        self.assertEqual(result_schema['properties']['timeout_seconds']['minimum'], 0)
        self.assertEqual(result_schema['properties']['timeout_seconds']['maximum'], 300)
        self.assertEqual(result_schema['required'], ['job_id'])
        self.assertNotIn('automation_status', tools)
        self.assertNotIn('automation_wait', tools)
        self.assertEqual(tools['automation_list'].inputSchema['properties']['limit']['maximum'], 50)
        self.assertEqual(tools['automation_list'].inputSchema['properties']['limit']['default'], 20)
        start_schema = tools['automation_start'].inputSchema
        self.assertEqual(start_schema['required'], ['target'])
        self.assertEqual(start_schema['properties']['wait_seconds']['minimum'], 0)
        self.assertEqual(start_schema['properties']['wait_seconds']['maximum'], 60)
        self.assertEqual(start_schema['properties']['wait_seconds']['default'], 30)
        log_schema = tools['automation_logs'].inputSchema
        self.assertEqual(log_schema['required'], ['job_id'])
        sqlcl_file = log_schema['properties']['sqlcl_file']
        self.assertIsNone(sqlcl_file['default'])
        self.assertTrue(any(branch.get('type') == 'string' and
                            branch.get('minLength') == 1
                            for branch in sqlcl_file['anyOf']))
        self.assertNotIn('automation_sqlcl_log', tools)
        self.assertNotIn('automation_sqlcl_files', tools)


if __name__ == '__main__':
    unittest.main()
