/**
 * Copy to Clipboard Dynamic Action plug-in
 * Oracle APEX 26.1
 */
window.fi_jaris_copy_to_clipboard = window.fi_jaris_copy_to_clipboard || {};

(function (apex, $, clipboard) {
  "use strict";

  const LOG_PREFIX = "[Clipboard DA]";
  const TOOLTIP_CLASS = "clipboard-tooltip";
  const SOURCE_TYPES = {
    ATTRIBUTE: "ATTRIBUTE",
    ITEM: "ITEM",
    TEXT: "TEXT",
    VALUE: "VALUE",
    STATIC: "STATIC",
    TEMPLATE: "TEMPLATE"
  };
  const FEEDBACK_TYPES = {
    TOOLTIP: "TOOLTIP",
    APEX_SUCCESS: "APEX_SUCCESS",
    NONE: "NONE"
  };

  function resume(daConfig, errorOccurred) {
    apex.da.resume(daConfig.resumeCallback, errorOccurred);
  }

  function legacyWriteText(text) {
    return new Promise(function (resolve, reject) {
      const textarea = document.createElement("textarea");

      textarea.value = text;
      textarea.setAttribute("readonly", "readonly");
      textarea.className = "clipboard-copy-text";
      document.body.appendChild(textarea);
      textarea.select();
      textarea.setSelectionRange(0, textarea.value.length);

      try {
        if (!document.execCommand("copy")) {
          throw new Error("document.execCommand('copy') returned false.");
        }
        resolve();
      } catch (error) {
        reject(error);
      } finally {
        textarea.remove();
      }
    });
  }

  function writeText(text) {
    if (window.isSecureContext && navigator.clipboard && navigator.clipboard.writeText) {
      return navigator.clipboard.writeText(text);
    }

    apex.debug.warn(
      LOG_PREFIX,
      "Clipboard API unavailable; using legacy copy fallback.",
      {
        isSecureContext: window.isSecureContext,
        hasClipboardApi: !!navigator.clipboard
      }
    );

    return legacyWriteText(text);
  }

  function firstAffectedElement(daConfig) {
    const affected$ = daConfig.affectedElements;

    if (!affected$ || !affected$.length) {
      return null;
    }

    if (affected$.length > 1) {
      apex.debug.warn(
        LOG_PREFIX,
        "Multiple affected elements found; only the first element will be used.",
        affected$.length
      );
    }

    return affected$.eq(0);
  }

  function requireAffectedElement(daConfig, sourceType) {
    const source$ = firstAffectedElement(daConfig);

    if (!source$) {
      throw new Error(
        "Source Type " + sourceType + " requires an affected element."
      );
    }

    return source$;
  }

  function resolveItemValue(itemName) {
    if (!itemName) {
      throw new Error("Source Item is required when Source Type is APEX Item.");
    }

    const item = apex.item(itemName);

    if (!item || !item.node) {
      throw new Error("APEX item not found: " + itemName);
    }

    return item.getValue();
  }

  function resolveTemplate(template) {
    if (typeof template !== "string") {
      throw new Error("Source Template is required when Source Type is Item Template.");
    }

    return template.replace(/\{([A-Za-z][A-Za-z0-9_$#]*)\}/g, function (match, itemName) {
      const item = apex.item(itemName);

      if (!item || !item.node) {
        apex.debug.warn(
          LOG_PREFIX,
          "Template item was not found; placeholder left unchanged.",
          itemName
        );
        return match;
      }

      const value = item.getValue();
      return value == null ? "" : String(value);
    });
  }

  function resolveText(settings, daConfig) {
    const sourceType = settings.sourceType || SOURCE_TYPES.ATTRIBUTE;
    let source$;
    let value;

    switch (sourceType) {
      case SOURCE_TYPES.ATTRIBUTE:
        source$ = requireAffectedElement(daConfig, sourceType);

        if (!settings.sourceAttribute) {
          throw new Error("Source Attribute is required for Element Attribute.");
        }

        value = source$.attr(settings.sourceAttribute);
        if (typeof value !== "string") {
          throw new Error(
            "Clipboard source attribute is missing: " + settings.sourceAttribute
          );
        }
        break;

      case SOURCE_TYPES.ITEM:
        value = resolveItemValue(settings.sourceItem);
        break;

      case SOURCE_TYPES.TEXT:
        source$ = requireAffectedElement(daConfig, sourceType);
        value = source$.text();
        break;

      case SOURCE_TYPES.VALUE:
        source$ = requireAffectedElement(daConfig, sourceType);
        value = source$.val();
        break;

      case SOURCE_TYPES.STATIC:
        value = settings.sourceText;
        break;

      case SOURCE_TYPES.TEMPLATE:
        value = resolveTemplate(settings.sourceTemplate);
        break;

      default:
        throw new Error("Unsupported Source Type: " + sourceType);
    }

    if (value == null) {
      throw new Error("Clipboard source resolved to no value.");
    }

    return {
      source$: source$ || null,
      text: Array.isArray(value) ? value.join(",") : String(value)
    };
  }

  function positionTooltip(tooltip$, anchor$) {
    if ($.ui && $.ui.position) {
      tooltip$.position({
        my: "center bottom-10",
        at: "center top",
        of: anchor$,
        collision: "flipfit"
      });
      return;
    }

    const offset = anchor$.offset();

    if (!offset) {
      apex.debug.warn(
        LOG_PREFIX,
        "Could not determine tooltip anchor position."
      );
      return;
    }

    tooltip$.css({
      top: offset.top - tooltip$.outerHeight() - 10,
      left: offset.left + (anchor$.outerWidth() - tooltip$.outerWidth()) / 2
    });
  }

  function showTooltip(anchor$, message, duration) {
    if (!anchor$ || !anchor$.length) {
      apex.debug.warn(LOG_PREFIX, "No element available for tooltip feedback.");
      return;
    }

    $("." + TOOLTIP_CLASS).stop(true, true).remove();

    const tooltip$ = $("<div>", {
      class: "ui-tooltip ui-corner-all ui-widget-shadow " + TOOLTIP_CLASS,
      role: "status",
      "aria-live": "polite"
    });

    $("<div>", {
      class: "ui-tooltip-content",
      text: message
    }).appendTo(tooltip$);

    tooltip$.appendTo(document.body);
    positionTooltip(tooltip$, anchor$);

    window.setTimeout(function () {
      tooltip$.fadeOut(100, function () {
        tooltip$.remove();
      });
    }, duration);
  }

  function showFeedback(settings, daConfig, source$) {
    const feedbackType = settings.feedbackType || FEEDBACK_TYPES.TOOLTIP;

    if (feedbackType === FEEDBACK_TYPES.NONE) {
      return;
    }

    if (feedbackType === FEEDBACK_TYPES.APEX_SUCCESS) {
      apex.message.showPageSuccess(settings.successMessage);
      return;
    }

    const anchor$ = daConfig.triggeringElement
      ? $(daConfig.triggeringElement)
      : source$;

    showTooltip(
      anchor$,
      settings.successMessage,
      settings.tooltipDuration
    );
  }

  clipboard.copy = function (settings, daConfig) {
    let resolved;

    apex.debug.info(
      LOG_PREFIX,
      "Copy to clipboard action fired.",
      {
        sourceType: settings.sourceType,
        feedbackType: settings.feedbackType,
        affectedElementCount: daConfig.affectedElements
          ? daConfig.affectedElements.length
          : 0
      }
    );

    try {
      resolved = resolveText(settings, daConfig);
    } catch (error) {
      apex.debug.error(LOG_PREFIX, "Clipboard source resolution failed.", error);
      resume(daConfig, true);
      return;
    }

    writeText(resolved.text)
      .then(function () {
        apex.debug.info(
          LOG_PREFIX,
          "Clipboard copy completed.",
          {
            sourceType: settings.sourceType,
            textLength: resolved.text.length
          }
        );

        showFeedback(settings, daConfig, resolved.source$);
        resume(daConfig, false);
      })
      .catch(function (error) {
        apex.debug.error(
          LOG_PREFIX,
          "Clipboard copy failed.",
          error
        );
        resume(daConfig, true);
      });
  };
})(apex, apex.jQuery, window.fi_jaris_copy_to_clipboard);
