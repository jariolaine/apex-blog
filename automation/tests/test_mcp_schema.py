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
            'automation_start', 'automation_status', 'automation_logs',
            'automation_result', 'automation_list', 'automation_cancel',
            'automation_sqlcl_files', 'automation_sqlcl_log',
        })
        for tool in tools:
            with self.subTest(tool=tool.name):
                self.assertTrue(tool.description)
                properties = tool.inputSchema['properties']
                self.assertTrue(properties)
                for name, property_schema in properties.items():
                    with self.subTest(parameter=name):
                        self.assertTrue(property_schema.get('description'),
                                        f'{tool.name}.{name} has no inputSchema description')

    async def test_log_paging_defaults_and_bounds_are_in_schema(self):
        tools = {tool.name: tool for tool in await mcp.list_tools()}
        for tool_name in ('automation_logs', 'automation_sqlcl_log'):
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
        self.assertEqual(tools['automation_list'].inputSchema['properties']['limit']['maximum'], 50)
        self.assertEqual(tools['automation_list'].inputSchema['properties']['limit']['default'], 20)
        self.assertIn('target', tools['automation_start'].inputSchema['required'])
        self.assertIn('name', tools['automation_sqlcl_log'].inputSchema['required'])


if __name__ == '__main__':
    unittest.main()
