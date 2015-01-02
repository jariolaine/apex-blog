--._______ .__   __.  __  ___  __  .___________. _______   ______
--|   ____||  \ |  | |  |/  / |  | |           ||   ____| /      |
--|  |__   |   \|  | |  '  /  |  | `---|  |----`|  |__   |  ,----'
--|   __|  |  . `  | |    <   |  |     |  |     |   __|  |  |
--|  |____ |  |\   | |  .  \  |  |     |  |     |  |____ |  `----.
--|_______||__| \__| |__|\__\ |__|     |__|     |_______| \______|
--
--  ========================= Navbar ============================

FUNCTION enkitec_navbar_render (
   p_region              IN APEX_PLUGIN.T_REGION,
   p_plugin              IN APEX_PLUGIN.T_PLUGIN,
   p_is_printer_friendly IN BOOLEAN
)

   RETURN APEX_PLUGIN.T_REGION_RENDER_RESULT

IS

   CURSOR list_entries_cur(
      p_list_id IN APEX_APPLICATION_LIST_ENTRIES.LIST_ID%TYPE
   )
   IS
      WITH list_entries AS (
         SELECT entry_text,
            entry_target,
            entry_attribute_01,
            entry_attribute_02,
            NVL(current_for_pages_type_code, 'TARGET_PAGE') AS current_for_pages_type_code,
            current_for_pages_expression,
            (
               SELECT build_option_id
               FROM apex_application_build_options
               WHERE build_option_name = p.build_option
            ) AS build_option_id,
            authorization_scheme_id,
            condition_type_code,
            condition_expression1,
            condition_expression2,
            list_entry_id,
            (
               SELECT COUNT(1)
               FROM apex_application_list_entries
               WHERE list_entry_parent_id = p.list_entry_id
            ) children,
            list_entry_parent_id,
            display_sequence
         FROM apex_application_list_entries p
         WHERE list_id = list_entries_cur.p_list_id
      )
      SELECT LEVEL AS lev,
         le.*
      FROM list_entries le
      CONNECT BY NOCYCLE PRIOR le.list_entry_id = le.list_entry_parent_id
      START WITH le.list_entry_parent_id IS NULL
      ORDER SIBLINGS BY le.display_sequence;

   TYPE list_entries_aat IS TABLE OF LIST_ENTRIES_CUR%ROWTYPE
      INDEX BY PLS_INTEGER;

   TYPE list_entries_show_aat IS TABLE OF BOOLEAN
      INDEX BY VARCHAR2(100);

   l_retval            APEX_PLUGIN.T_REGION_RENDER_RESULT;
   l_list_name         APEX_APPLICATION_LIST_ENTRIES.LIST_NAME%TYPE := p_region.attribute_01;
   l_result_set        APEX_PLUGIN_UTIL.T_COLUMN_VALUE_LIST;
   l_display_brand     VARCHAR2(1) := p_region.attribute_02;
   l_brand_label       VARCHAR2(4000) := p_region.attribute_03;
   l_brand_url         VARCHAR2(500) := p_region.attribute_04;
   l_make_responsive   VARCHAR2(500) := p_region.attribute_06;
   l_prev_lev          PLS_INTEGER;
   l_list_rec          APEX_APPLICATION_LISTS%ROWTYPE;
   l_list_exists       BOOLEAN;
   l_list_entries      LIST_ENTRIES_AAT;
   l_show_entry        BOOLEAN;
   l_hidding_children  BOOLEAN := FALSE;
   l_hide_till_level   PLS_INTEGER;
   l_is_current        BOOLEAN;
   l_show_cache        LIST_ENTRIES_SHOW_AAT;
   l_has_visible_child BOOLEAN;
   e_num_val_error     EXCEPTION;
   PRAGMA EXCEPTION_INIT(e_num_val_error, -06502);

   FUNCTION show_entry(
      p_entry_id                IN APEX_APPLICATION_LIST_ENTRIES.LIST_ENTRY_ID%TYPE,
      p_build_option_id         IN APEX_APPLICATION_BUILD_OPTIONS.BUILD_OPTION_ID%TYPE,
      p_authorization_scheme_id IN APEX_APPLICATION_LIST_ENTRIES.AUTHORIZATION_SCHEME_ID%TYPE,
      p_condition_type_code     IN APEX_APPLICATION_LIST_ENTRIES.CONDITION_TYPE_CODE%TYPE,
      p_condition_expression1   IN APEX_APPLICATION_LIST_ENTRIES.CONDITION_EXPRESSION1%TYPE,
      p_condition_expression2   IN APEX_APPLICATION_LIST_ENTRIES.CONDITION_EXPRESSION2%TYPE
   )

      RETURN BOOLEAN

   IS

      l_retval   BOOLEAN;
      l_entry_id VARCHAR2(100);

   BEGIN

      l_entry_id := TO_CHAR(p_entry_id);

      IF l_show_cache.exists(l_entry_id)
      THEN
         l_retval := l_show_cache(l_entry_id);
      ELSE
         l_retval := apex_plugin_util.is_component_used (
            p_build_option_id         => p_build_option_id,
            p_authorization_scheme_id => p_authorization_scheme_id,
            p_condition_type          => p_condition_type_code,
            p_condition_expression1   => p_condition_expression1,
            p_condition_expression2   => p_condition_expression2
         );

         l_show_cache(l_entry_id) := l_retval;
      END IF;

      RETURN l_retval;

   END show_entry;

   FUNCTION is_current(
      p_current_for_pages_type_code  IN APEX_APPLICATION_LIST_ENTRIES.CURRENT_FOR_PAGES_TYPE_CODE%TYPE,
      p_current_for_pages_expression IN APEX_APPLICATION_LIST_ENTRIES.CURRENT_FOR_PAGES_EXPRESSION%TYPE,
      p_entry_target                 IN APEX_APPLICATION_LIST_ENTRIES.ENTRY_TARGET%TYPE
   )

      RETURN BOOLEAN

   IS

      l_retval     BOOLEAN;
      l_page       VARCHAR2(100);
      l_result     VARCHAR2(1);
      l_result_set APEX_PLUGIN_UTIL.T_COLUMN_VALUE_LIST;

      PROCEDURE check_with_page_alias(
         p_page_alias IN VARCHAR2
      )
      IS
         l_page_id NUMBER;
      BEGIN
         IF p_page_alias IS NULL
         THEN
            l_retval := FALSE;
         ELSE
            SELECT page_id
            INTO l_page_id
            FROM apex_application_pages
            WHERE application_id = v('APP_ID')
               AND page_alias = p_page_alias;

            l_retval := l_page_id = apex_application.g_flow_step_id;
         END IF;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            l_retval := FALSE;
      END;

   BEGIN

      IF (p_current_for_pages_type_code IS NULL
         AND l_list_rec.list_type_code = 'SQL_QUERY')
            OR p_current_for_pages_type_code = 'TARGET_PAGE'
      THEN
         BEGIN
            l_page := SUBSTR(p_entry_target, INSTR(p_entry_target, ':', 1, 1) + 1, INSTR(p_entry_target, ':', 1, 2) - INSTR(p_entry_target, ':', 1, 1) - 1);
            l_retval := l_page = apex_application.g_flow_step_id;
         EXCEPTION
            WHEN e_num_val_error
            THEN
               check_with_page_alias(l_page);
         END;
      ELSIF p_current_for_pages_type_code IN ('ALWAYS', 'YES')
      THEN
         l_retval := TRUE;
      ELSIF p_current_for_pages_type_code IN ('NEVER','NO')
      THEN
         l_retval := FALSE;
      ELSIF p_current_for_pages_type_code = 'COLON_DELIMITED_PAGE_LIST'
      THEN
         l_retval := INSTR(':' || REPLACE(REPLACE(p_current_for_pages_expression,' ', ''), ',', ':') || ':', ':' || apex_application.g_flow_step_id || ':') > 0;
      ELSIF p_current_for_pages_type_code = 'PLSQL_EXPRESSION'
      THEN
         l_result := apex_plugin_util.get_plsql_function_result('BEGIN IF ' || p_current_for_pages_expression || ' THEN RETURN ''Y''; ELSE RETURN ''N''; END IF; END;');
         l_retval :=
            CASE l_result
               WHEN 'Y' THEN TRUE
               WHEN 'N' THEN FALSE
            END;
      ELSIF p_current_for_pages_type_code IN ('EXISTS','NOT_EXISTS')
      THEN
         l_result_set := apex_plugin_util.get_data(p_current_for_pages_expression, 1, 1000, p_region.name);
         l_retval :=
            CASE
               WHEN p_current_for_pages_type_code = 'EXISTS' AND l_result_set(1).count > 0
               THEN TRUE
               WHEN p_current_for_pages_type_code = 'EXISTS' AND l_result_set(1).count = 0
               THEN FALSE
               WHEN p_current_for_pages_type_code = 'NOT_EXISTS' AND l_result_set(1).count > 0
               THEN FALSE
               WHEN p_current_for_pages_type_code = 'NOT_EXISTS' AND l_result_set(1).count = 0
               THEN TRUE
            END;
      ELSE
         RAISE_APPLICATION_ERROR(-20001, 'Current list entry type of "' || p_current_for_pages_type_code || '" is not supported.');
      END IF;

      RETURN l_retval;

   END is_current;

BEGIN

   IF apex_application.g_debug
   THEN
      apex_plugin_util.debug_region (
         p_plugin => p_plugin,
         p_region => p_region
      );
   END IF;

   apex_css.add_file(
      p_name      => 'enkitec-navbar.min',
      p_directory => p_plugin.file_prefix,
      p_version   => NULL
   );

   IF l_make_responsive = 'N'
   THEN
      apex_javascript.add_library (
         p_name      => 'enkitec-navbar.min',
         p_directory => p_plugin.file_prefix,
         p_version   => NULL
      );
   ELSE
      apex_javascript.add_library (
         p_name      => 'enkitec-navbar-responsive.min',
         p_directory => p_plugin.file_prefix,
         p_version   => NULL
      );
   END IF;

   BEGIN

      SELECT *
      INTO l_list_rec
      FROM apex_application_lists
      WHERE list_name = enkitec_navbar_render.l_list_name
         AND application_id = v('APP_ID');

   EXCEPTION

      WHEN NO_DATA_FOUND
      THEN
         RAISE_APPLICATION_ERROR(-20001, 'There is no list that matches the name: "' || l_list_name || '"');

      WHEN TOO_MANY_ROWS
      THEN
         RAISE_APPLICATION_ERROR(-20001, 'More than one list matches the name: "' || l_list_name || '"');

   END;

   IF l_list_rec.list_type_code = 'STATIC'
   THEN
      OPEN list_entries_cur(l_list_rec.list_id);
      FETCH list_entries_cur BULK COLLECT INTO l_list_entries;
      CLOSE list_entries_cur;
   ELSIF l_list_rec.list_type_code = 'SQL_QUERY'
   THEN
      l_result_set := apex_plugin_util.get_data(l_list_rec.list_query, 4, 9, p_region.name);

      FOR x IN 1 .. l_result_set(1).count
      LOOP
         l_list_entries(x).lev := l_result_set(1)(x);
         l_list_entries(x).entry_text := l_result_set(2)(x);
         l_list_entries(x).entry_target := l_result_set(3)(x);
         l_list_entries(x).current_for_pages_type_code := l_result_set(4)(x);
         l_list_entries(x).entry_attribute_01 :=
            CASE
               WHEN l_result_set.exists(8)
               THEN l_result_set(8)(x)
            END;
         l_list_entries(x).entry_attribute_02 :=
            CASE
               WHEN l_result_set.exists(9)
               THEN l_result_set(9)(x)
            END;
      END LOOP;
   END IF;


   sys.htp.p('<div class="ek-nb"><div class="navbar"><div class="navbar-inner">');

   IF l_make_responsive = 'Y'
   THEN
      sys.htp.p(
         '<div class="container">' ||
            '<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">' ||
               '<span class="icon-bar"></span>' ||
               '<span class="icon-bar"></span>' ||
               '<span class="icon-bar"></span>' ||
            '</a>'
      );
   END IF;

   IF l_display_brand = 'Y'
   THEN
      IF l_brand_url IS NOT NULL
      THEN
         sys.htp.p('<a class="brand" href="' || apex_plugin_util.replace_substitutions(l_brand_url) || '">' || l_brand_label || '</a>');
      ELSE
         sys.htp.p('<span class="brand">' || l_brand_label || '</span>');
      END IF;
   END IF;

   IF l_make_responsive = 'Y'
   THEN
      sys.htp.p('<div class="nav-collapse collapse">');
   END IF;

   sys.htp.p('<ul class="nav">');

   FOR curr_entry_idx IN 1 .. l_list_entries.count
   LOOP
      l_has_visible_child := FALSE;

      IF l_list_rec.list_type_code = 'SQL_QUERY'
      THEN
         IF l_list_entries.exists(curr_entry_idx + 1)
            AND l_list_entries(curr_entry_idx + 1).lev = l_list_entries(curr_entry_idx).lev + 1
         THEN
            l_has_visible_child := TRUE;
         END IF;
      ELSIF l_list_entries(curr_entry_idx).children > 0
      THEN
         FOR x IN 1 .. l_list_entries.count
         LOOP
            IF l_list_entries.exists(curr_entry_idx + x)
               AND l_list_entries(curr_entry_idx + x).lev = l_list_entries(curr_entry_idx).lev + 1
            THEN
               l_has_visible_child := show_entry(
                  p_entry_id                => l_list_entries(curr_entry_idx + x).list_entry_id,
                  p_build_option_id         => l_list_entries(curr_entry_idx + x).build_option_id,
                  p_authorization_scheme_id => l_list_entries(curr_entry_idx + x).authorization_scheme_id,
                  p_condition_type_code     => l_list_entries(curr_entry_idx + x).condition_type_code,
                  p_condition_expression1   => l_list_entries(curr_entry_idx + x).condition_expression1,
                  p_condition_expression2   => l_list_entries(curr_entry_idx + x).condition_expression2
               );

               IF l_has_visible_child THEN EXIT; END IF;
            ELSE
               EXIT;
            END IF;
         END LOOP;
      END IF;

      IF l_hidding_children
      THEN
         IF l_list_entries(curr_entry_idx).lev <= l_hide_till_level
         THEN
            l_hidding_children := FALSE;
         END IF;
      END IF;

      IF l_list_rec.list_type_code = 'SQL_QUERY'
      THEN
         l_show_entry := TRUE;
      ELSIF NOT l_hidding_children
      THEN
         l_show_entry := show_entry(
            p_entry_id                => l_list_entries(curr_entry_idx).list_entry_id,
            p_build_option_id         => l_list_entries(curr_entry_idx).build_option_id,
            p_authorization_scheme_id => l_list_entries(curr_entry_idx).authorization_scheme_id,
            p_condition_type_code     => l_list_entries(curr_entry_idx).condition_type_code,
            p_condition_expression1   => l_list_entries(curr_entry_idx).condition_expression1,
            p_condition_expression2   => l_list_entries(curr_entry_idx).condition_expression2
         );
      END IF;

      IF l_hidding_children
      THEN
         NULL;
      ELSIF NOT l_show_entry
      THEN
         l_hidding_children := TRUE;
         l_hide_till_level := l_list_entries(curr_entry_idx).lev;
      ELSE
         IF NVL(l_list_entries(curr_entry_idx).entry_attribute_01,'X') NOT IN ('divider','header')
         THEN
            l_is_current := is_current(
               p_current_for_pages_type_code  => l_list_entries(curr_entry_idx).current_for_pages_type_code,
               p_current_for_pages_expression => l_list_entries(curr_entry_idx).current_for_pages_expression,
               p_entry_target                 => l_list_entries(curr_entry_idx).entry_target
            );
         END IF;

         IF l_list_entries(curr_entry_idx).lev = 1
         THEN
            IF l_prev_lev > 1 --null on first loop
            THEN
               FOR x IN 1 .. (l_prev_lev - l_list_entries(curr_entry_idx).lev)
               LOOP
                  sys.htp.p('</ul></li>');
               END LOOP;
            END IF;

            IF l_list_entries(curr_entry_idx).entry_attribute_01 = 'divider'
            THEN
               sys.htp.p('<li class="divider-vertical"></li>');
            ELSIF l_has_visible_child
            THEN
               sys.htp.p('<li class="dropdown ' ||
                  CASE WHEN l_is_current THEN ' active' END ||
                  '"><a tabindex="-1" class="dropdown-toggle" data-toggle="dropdown" href="#">' ||
                  CASE
                     WHEN l_list_entries(curr_entry_idx).entry_attribute_02 IS NOT NULL
                     THEN '<i class="' || l_list_entries(curr_entry_idx).entry_attribute_02 || '"></i> '
                  END ||
                  l_list_entries(curr_entry_idx).entry_text || '<b class="caret"></b></a>'
               );
            ELSE
               sys.htp.p('<li' ||
                  CASE WHEN l_is_current THEN ' class="active" ' END ||
                  '><a tabindex="-1" href="' || apex_util.prepare_url(apex_plugin_util.replace_substitutions(l_list_entries(curr_entry_idx).entry_target))  ||
                  '">' ||
                  CASE
                     WHEN l_list_entries(curr_entry_idx).entry_attribute_02 IS NOT NULL
                     THEN '<i class="' || l_list_entries(curr_entry_idx).entry_attribute_02 || '"></i> '
                  END ||
                  l_list_entries(curr_entry_idx).entry_text || '</a></li>'
               );
            END IF;

            IF NOT l_list_entries.exists(curr_entry_idx + 1)
            THEN
               sys.htp.p('</ul></li>');
            END IF;

            l_prev_lev := l_list_entries(curr_entry_idx).lev;
         ELSIF l_list_entries(curr_entry_idx).lev = 2
         THEN
            IF l_prev_lev > 2
            THEN
               FOR x IN 1 .. (l_prev_lev - l_list_entries(curr_entry_idx).lev)
               LOOP
                  sys.htp.p('</ul></li>');
               END LOOP;
            END IF;

            IF l_prev_lev = 1
            THEN
               sys.htp.p('<ul class="dropdown-menu" role="menu">');
            END IF;

            IF l_list_entries(curr_entry_idx).entry_attribute_01 = 'divider'
            THEN
               sys.htp.p('<li class="divider"></li>');
            ELSIF l_list_entries(curr_entry_idx).entry_attribute_01 = 'header'
            THEN
               sys.htp.p('<li class="nav-header">' || l_list_entries(curr_entry_idx).entry_text || '</li>');
            ELSIF l_has_visible_child
            THEN
               sys.htp.p('<li class="dropdown-submenu' ||
                  CASE WHEN l_is_current THEN ' active' END ||
                  '"><a tabindex="-1" href="' || apex_util.prepare_url(apex_plugin_util.replace_substitutions(l_list_entries(curr_entry_idx).entry_target)) ||
                     '">' ||
                     CASE
                        WHEN l_list_entries(curr_entry_idx).entry_attribute_02 IS NOT NULL
                        THEN '<i class="' || l_list_entries(curr_entry_idx).entry_attribute_02 || '"></i> '
                     END ||
                     l_list_entries(curr_entry_idx).entry_text || '</a><ul class="dropdown-menu">'
               );
            ELSE
               sys.htp.p('<li' ||
                  CASE WHEN l_is_current THEN ' class="active" ' END ||
                  '><a tabindex="-1" href="' || apex_util.prepare_url(apex_plugin_util.replace_substitutions(l_list_entries(curr_entry_idx).entry_target)) ||
                  '">' ||
                  CASE
                     WHEN l_list_entries(curr_entry_idx).entry_attribute_02 IS NOT NULL
                     THEN '<i class="' || l_list_entries(curr_entry_idx).entry_attribute_02 || '"></i> '
                  END ||
                  l_list_entries(curr_entry_idx).entry_text || '</a></li>'
               );
            END IF;

            IF NOT l_list_entries.exists(curr_entry_idx + 1)
            THEN
               FOR x IN 1 .. l_list_entries(curr_entry_idx).lev - 1
               LOOP
                  sys.htp.p('</ul></li>');
               END LOOP;
            END IF;

            l_prev_lev := l_list_entries(curr_entry_idx).lev;
         ELSE
            IF l_prev_lev > l_list_entries(curr_entry_idx).lev
            THEN
               FOR x IN 1 .. (l_prev_lev - l_list_entries(curr_entry_idx).lev)
               LOOP
                  sys.htp.p('</ul></li>');
               END LOOP;
            END IF;

            IF l_list_entries(curr_entry_idx).entry_attribute_01 = 'divider'
            THEN
               sys.htp.p('<li class="divider"></li>');
            ELSIF l_list_entries(curr_entry_idx).entry_attribute_01 = 'header'
            THEN
               sys.htp.p('<li class="nav-header">' || l_list_entries(curr_entry_idx).entry_text || '</li>');
            ELSIF l_has_visible_child
            THEN
               sys.htp.p('<li class="dropdown-submenu' ||
                  CASE WHEN l_is_current THEN ' active' END ||
                  '"><a tabindex="-1" href="' || apex_util.prepare_url(apex_plugin_util.replace_substitutions(l_list_entries(curr_entry_idx).entry_target)) ||
                     '">' ||
                     CASE
                        WHEN l_list_entries(curr_entry_idx).entry_attribute_02 IS NOT NULL
                        THEN '<i class="' || l_list_entries(curr_entry_idx).entry_attribute_02 || '"></i> '
                     END ||
                     l_list_entries(curr_entry_idx).entry_text || '</a><ul class="dropdown-menu">'
               );
            ELSE
               sys.htp.p('<li' ||
                  CASE WHEN l_is_current THEN ' class="active" ' END ||
                  '><a tabindex="-1" href="' || apex_util.prepare_url(apex_plugin_util.replace_substitutions(l_list_entries(curr_entry_idx).entry_target)) ||
                  '">' ||
                  CASE
                     WHEN l_list_entries(curr_entry_idx).entry_attribute_02 IS NOT NULL
                     THEN '<i class="' || l_list_entries(curr_entry_idx).entry_attribute_02 || '"></i> '
                  END ||
                  l_list_entries(curr_entry_idx).entry_text || '</a></li>'
               );
            END IF;

            IF NOT l_list_entries.exists(curr_entry_idx + 1)
            THEN
               FOR x IN 1 .. l_list_entries(curr_entry_idx).lev - 1
               LOOP
                  sys.htp.p('</ul></li>');
               END LOOP;
            END IF;

            l_prev_lev := l_list_entries(curr_entry_idx).lev;
         END IF;
      END IF;
   END LOOP;

   IF l_make_responsive = 'Y'
   THEN
      sys.htp.p('</div></div>');
   END IF;

   sys.htp.p('</ul></div></div></div>');

   RETURN l_retval;

END enkitec_navbar_render;