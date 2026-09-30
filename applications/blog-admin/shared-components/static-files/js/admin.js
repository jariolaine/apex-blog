/**
 * @namespace blog
 * @description Blog administration JavaScript for Oracle APEX 26.1.
 */
window.blog = window.blog || {};

(function ($, region, blog) {
  "use strict";

  const BLOG_GENERIC_ERROR = "BLOG_GENERIC_ERROR";
  const LOG_PREFIX = "[blog.admin]";

  function get_message(message) {
    if (apex.lang.hasMessage(message)) {
      return apex.lang.getMessage(message);
    }

    apex.debug.info(
      LOG_PREFIX,
      "Message key not found; using literal value.",
      message
    );
    return message;
  }

  function showPageError(message, context) {

    apex.debug.error(
      LOG_PREFIX,
      context,
      message
    );

    apex.message.clearErrors();
    apex.message.showErrors([
      {
        type: "error",
        location: "page",
        message: message
      }
    ]);
  }

  function getButton$(element) {
    const element$ = $(element);
    return element$.is(":button") ? element$ : element$.closest("button");
  }

  function addGlobalAction(action) {
    const existingAction = apex.actions.lookup(action.name);

    if (existingAction) {
      if (existingAction.blogAdminOwned === true) {
        apex.debug.warn(
          LOG_PREFIX,
          "Replacing a previously registered blog.admin action.",
          action.name
        );
        apex.actions.remove(action.name);
      } else {
        apex.debug.error(
          LOG_PREFIX,
          "Global action name collision; existing action was not replaced.",
          action.name
        );
        return false;
      }
    }

    action.blogAdminOwned = true;
    const added = apex.actions.add(action);

    if (added === false) {
      apex.debug.error(
        LOG_PREFIX,
        "Failed to add global action.",
        action.name
      );
      return false;
    }

    apex.debug.info(
      LOG_PREFIX,
      "Global action registered.",
      action.name
    );
    return true;
  }

  blog.admin = {

    /**
     * @module blog.admin.ir
     */
    ir: {
      /**
       * @function blog.admin.ir.filesAfterRefresh
       * @desc Handle page 70 Files interactive report after refresh actions.
       */
      filesAfterRefresh: function (options) {
        options = $.extend({
          loadingIconClass: ["fa-refresh", "fa-anim-spin"],
          onOffIconClass: ["fa-check-square-o", "fa-square-o"]
        }, options);

        apex.debug.info(
          LOG_PREFIX,
          "Files IR refresh handler.",
          {
            browserEvent: options.browserEvent
          }
        );

        if (options.browserEvent !== "load") {
          return;
        }

          addGlobalAction({
            name: "select-file",
            action: (event, element, args) => {
              const button$ = getButton$(element);
              const icon$ = button$.children(".t-Icon");
              const seqId = button$.data("seq");
              let errMsg = get_message(BLOG_GENERIC_ERROR);

              apex.debug.info(
                LOG_PREFIX,
                "Select file action invoked.",
                {
                  process: args && args.process,
                  id: args && args.id,
                  seqId: seqId
                }
              );

              if (!button$.length) {
                apex.debug.error(
                  LOG_PREFIX, "Select file action could not resolve its button element.",
                  element
                );
                return;
              }

              if (!args || !args.process) {
                apex.debug.error(
                  LOG_PREFIX, "Select file action has no Ajax process name.",
                  args
                );
                return;
              }

              button$.prop("disabled", true);
              icon$
                .removeClass(options.onOffIconClass)
                .addClass(options.loadingIconClass);

              apex.server.process(
                args.process,
                {
                  x01: seqId,
                  x02: args.id
                }
              )
                .done(function (data) {
                  apex.debug.info(LOG_PREFIX, "Select file Ajax response received.",
                    {
                      process: args.process,
                      hasSeq: !!data && Object.prototype.hasOwnProperty.call(data, "seq"),
                      keys: data && typeof data === "object" ? Object.keys(data) : []
                    }
                  );

                  if (data && Object.prototype.hasOwnProperty.call(data, "seq")) {
                    icon$.addClass(
                      data.seq
                        ? options.onOffIconClass[0]
                        : options.onOffIconClass[1]
                    );

                    button$
                      .attr("aria-checked", data.seq ? "true" : "false")
                      .data("seq", data.seq);

                    return;
                  }

                  if (data && Object.prototype.hasOwnProperty.call(data, "errMsg")) {
                    errMsg = get_message(data.errMsg);
                  }

                  showPageError(
                    errMsg,
                    "Select file process returned no seq property."
                  );
                })
                .fail(function (jqXHR, textStatus, errorThrown) {
                  apex.debug.error(
                    LOG_PREFIX, "Select file Ajax request failed.",
                    {
                      process: args.process,
                      textStatus: textStatus,
                      errorThrown: errorThrown,
                      status: jqXHR && jqXHR.status
                    }
                  );

                  showPageError(
                    errMsg,
                    "Select file Ajax request failed."
                  );
                })
                .always(function () {
                  icon$.removeClass(options.loadingIconClass);
                  button$.prop("disabled", false);

                  apex.debug.info(
                    LOG_PREFIX,
                    "Select file action cleanup completed."
                  );
                });
            }
          });
      },

      /**
       * @function blog.admin.ir.commentsAfterRefresh
       * @desc Handle page 60 Comments interactive report after refresh actions.
       */
      commentsAfterRefresh: function (options) {
        options = $.extend({
          openLink: "a[data-unread=\"true\"]",
          newClass: "fa-envelope-open-o",
          oldClass: ["fa-envelope-o", "fa-envelope-arrow-down"],
          titleMsg: "BLOG_LOV_COMMENT_FLAG_READ"
        }, options);

        if (!options.region$ || !options.region$.length) {
          apex.debug.warn(
            LOG_PREFIX,
            "Comments IR region is unavailable after refresh."
          );
          return;
        }

        const unreadLinks$ = options.region$.find(options.openLink);

        apex.debug.info(
          LOG_PREFIX,
          "Initializing unread comment links.", {
          count: unreadLinks$.length
        });

        unreadLinks$.one("click.blogAdminComments", function () {
          const targetId = $(this).data("id");
          const target = $x(targetId);

          if (!target) {
            apex.debug.warn(
              LOG_PREFIX,
              "Comment status target was not found.",
              targetId
            );
            return true;
          }

          $(target)
            .removeClass(options.oldClass)
            .addClass(options.newClass)
            .attr("title", get_message(options.titleMsg));

          apex.debug.info(
            LOG_PREFIX,
            "Comment marked read in the UI.",
            targetId
          );
          return true;
        });
      }
    },

    /**
     * @module blog.admin.ig
     */
    ig: {
      /**
       * @function blog.admin.ig.processChildFeatures
       * @desc Hide/show child features depending on the parent feature state.
       */
      processChildFeatures: function (pElement) {
        const domElement = $x(pElement);

        if (!domElement) {
          apex.debug.warn(
            LOG_PREFIX,
            "processChildFeatures target was not found.",
            pElement
          );
          return;
        }

        const element$ = $(domElement);
        const nextRowsToHide = "tr:has(span.blog-feature-level1),tr:has(th)";
        const readOnlyClass = "is-readonly blog-text-line-through";
        const lineThroughClass = "blog-text-line-through";

        apex.debug.info(LOG_PREFIX, "Processing child feature visibility.", {
          element: pElement,
          invokedByInput: element$.is("input")
        });

        if (element$.is("input")) {
          const thisRow$ = element$.parents("tr:has(span[data-status])").first();
          const label$ = thisRow$.find("td:first-child>span[data-status]");

          if (!thisRow$.length) {
            apex.debug.warn(
              LOG_PREFIX,
              "Parent feature row could not be resolved.",
              pElement
            );
            return;
          }

          if (element$.is(":checked")) {
            const affectedRows$ = thisRow$.nextUntil(
              "tr:has(span[data-status=\"Exclude\"]),tr:has(th)"
            );
            const nextRow$ = affectedRows$.next("tr:has(td)");

            affectedRows$.children("td:first-child").removeClass(lineThroughClass);
            affectedRows$.children("td:nth-child(2)").removeClass(readOnlyClass);

            nextRow$.children("td:first-child").removeClass(lineThroughClass);
            nextRow$.children("td:nth-child(2)").removeClass(readOnlyClass);

            label$.attr("data-status", "Include");

            apex.debug.info(LOG_PREFIX, "Child features enabled.", {
              affectedRows: affectedRows$.length,
              includedNextRow: nextRow$.length > 0
            });
          } else {
            const affectedRows$ = thisRow$.nextUntil(nextRowsToHide);

            affectedRows$.children("td:first-child").addClass(lineThroughClass);
            affectedRows$.children("td:nth-child(2)").addClass(readOnlyClass);

            label$.attr("data-status", "Exclude");

            apex.debug.info(
              LOG_PREFIX,
              "Child features disabled.", {
              affectedRows: affectedRows$.length
            });
          }

          return;
        }

        const affectedRows$ = element$
          .find("tr:has(span[data-status=\"Exclude\"])")
          .nextUntil(nextRowsToHide);

        affectedRows$.children("td:first-child").addClass(lineThroughClass);
        affectedRows$.children("td:nth-child(2)").addClass(readOnlyClass);

        apex.debug.info(
          LOG_PREFIX,
          "Initial excluded child feature styling applied.",
          {
            affectedRows: affectedRows$.length
          }
        );
      },

      /**
       * @function blog.admin.ig.region
       * @desc Interactive Grid region initialization code for APEX 26.1.
       */
      region: function (options) {
        const igId = options.regionDomId;

        if (!igId) {
          apex.debug.error(
            LOG_PREFIX,
            "IG initialization has no regionDomId.",
            options
          );
          return options;
        }

        const igRegion = region(igId);

        if (!igRegion || !igRegion.element || !igRegion.element.length) {
          apex.debug.error(
            LOG_PREFIX,
            "IG region could not be resolved.",
            igId
          );
          return options;
        }

        const isConfigIg = igRegion.element.hasClass("blog-config-ig");
        const toolbarData = $.apex.interactiveGrid.copyDefaultToolbar();

        apex.debug.info(
          LOG_PREFIX,
          "Initializing Interactive Grid.",
          {
            regionDomId: igId,
            isConfigIg: isConfigIg,
            columnCount: Array.isArray(options.columns) ? options.columns.length : undefined
          }
        );

        toolbarData.toolbarRemove("save");
        toolbarData.toolbarRemove("selection-add-row");
        options.toolbarData = toolbarData;

        if (isConfigIg) {
          options.reportSettingsArea = false;
          options.defaultGridViewOptions = $.extend(
            true,
            {},
            options.defaultGridViewOptions,
            {
              footer: false,
              collapsibleControlBreaks: false,
              reorderColumns: false,
              columnSort: false,
              resizeColumns: false
            }
          );
        }

        if (!Array.isArray(options.columns)) {
          apex.debug.warn(
            LOG_PREFIX,
            "IG columns configuration is not an array; column customization skipped.",
            igId
          );
        } else {
          options.columns.forEach(function (column) {
            if (isConfigIg) {
              $.extend(
                true,
                column,
                {
                  defaultGridColumnOptions: {
                    noHeaderActivate: true
                  }
                }
              );
              return;
            }

            if (column.name === "DISPLAY_SEQ") {
              options.defaultModelOptions = $.extend(
                {},
                options.defaultModelOptions,
                {
                  sequenceField: column.name,
                  sequenceStep: 10
                }
              );

              apex.debug.info(
                LOG_PREFIX,
                "IG sequence field configured.",
                {
                  regionDomId: igId,
                  sequenceField: column.name,
                  sequenceStep: 10
                }
              );
            }
          });
        }

        $(function () {
          apex.debug.info(
            LOG_PREFIX,
            "Registering Interactive Grid proxy actions.",
            igId
          );

          addGlobalAction({
            name: "save",
            action: function () {
              apex.debug.info(
                LOG_PREFIX,
                "Invoking IG save action.",
                igId
              );
              region(igId).call("getActions").invoke("save");
            }
          });

          if (!isConfigIg) {
            addGlobalAction({
              name: "selection-add-row",
              action: function () {
                apex.debug.info(
                  LOG_PREFIX,
                  "Invoking IG add-row action.",
                  igId
                );
                region(igId).call("getActions").invoke("selection-add-row");
              }
            });
          } else {
            blog.admin.ig.processChildFeatures(igId);
          }
        });

        apex.gPageContext$
          .off("apexreadyend.blogAdminIg." + igId)
          .on("apexreadyend.blogAdminIg." + igId, function () {
            apex.debug.info(
              LOG_PREFIX,
              "Setting IG edit mode after apexreadyend.",
              igId
            );

            try {
              region(igId).call("getActions").set("edit", true);
            } catch (error) {
              apex.debug.error(
                LOG_PREFIX,
                "Failed to enable IG edit mode.",
                igId,
                error
              );
            }
          });

        return options;
      }
    },

    /**
     * @module blog.admin.editor
     */
    editor: {
      /**
       * @function blog.admin.editor.init
       * @desc Rich Text Editor initialization code.
       */
      init: function (options) {
        const messageKey = "BLOG_TXT_OPEN_NEW_TAB";
        const linkTarget = "_blank";

        apex.debug.info(
          LOG_PREFIX,
          "Initializing Rich Text Editor link options.",
          {
            messageKey: messageKey,
            linkTarget: linkTarget
          }
        );

        options = $.extend(
          true,
          {
            editorOptions: {
              link: {
                decorators: {
                  openInNewTab: {
                    mode: "manual",
                    label: get_message(messageKey),
                    attributes: {
                      target: linkTarget
                    }
                  }
                }
              }
            }
          },
          options
        );

        apex.debug.info(
          LOG_PREFIX,
          "Rich Text Editor initialization completed.",
          options.editorOptions
        );

        return options;
      }
    },

    /**
     * @module blog.admin.ai
     */
    ai: {

      /**
       * @function blog.admin.ai.valueToAiInput
       * @desc Convert item value to AI context. Function strips HTML e.g. from editor.
       */
      valueToAiInput: function (pItem) {

        const html =
          apex.item(pItem).getValue();

        const content$
          = $("<div/>").html(html);

        content$
          .find("script, style, code, pre")
          .remove();

        content$
          .find("p, div, h1, h2, h3, h4, h5, h6, li, blockquote, br")
          .after("\n");

        return content$
          .text()
          .replace(/\u00a0/g, " ")
          .replace(/[ \t]+/g, " ")
          .replace(/\n\s*\n+/g, "\n")
          .trim();
      },

      /**
       * @function blog.admin.ai.useResponse
       * @desc Convert AI Assistant Markdown response to HTML and set the post body.
       */
      useResponse: function (options) {
        options = $.extend(
          {
            process: "MARKDOWN_TO_HTML"
          },
          options
        );

        apex.debug.info(
          LOG_PREFIX,
          "AI Assistant response handling started.",
          {
            postItem: options.postItem,
            process: options.process,
            textType: typeof options.text,
            textLength: typeof options.text === "string" ? options.text.length : undefined
          }
        );

        if (typeof options.text !== "string") {
          apex.debug.error(
            LOG_PREFIX,
            "AI Assistant response is not a string.",
            {
              textType: typeof options.text,
              process: options.process
            }
          );
          return;
        }

        apex.server.process(
          options.process,
          {
            f01: apex.server.chunk(options.text)
          },
          {
            dataType: "html"
          }
        )
          .done(function (html) {
            apex.debug.info(
              LOG_PREFIX,
              "Markdown-to-HTML conversion succeeded.",
              {
                process: options.process,
                htmlLength: typeof html === "string" ? html.length : undefined
              }
            );

            apex.item(options.postItem).setValue(html);

          })
          .fail(function (jqXHR, textStatus, errorThrown) {
            apex.debug.error(
              LOG_PREFIX,
              "Markdown-to-HTML conversion failed.",
              {
                process: options.process,
                textStatus: textStatus,
                errorThrown: errorThrown,
                status: jqXHR && jqXHR.status
              }
            );

            showPageError(
              get_message(BLOG_GENERIC_ERROR),
              "Markdown-to-HTML conversion failed."
            );
          });

      },

    },

  };

  apex.debug.info(
    LOG_PREFIX,
    "JavaScript module loaded.",
    {
      apexVersion: apex.env.APEX_VERSION
    }
  );

})(apex.jQuery, apex.region, window.blog);
