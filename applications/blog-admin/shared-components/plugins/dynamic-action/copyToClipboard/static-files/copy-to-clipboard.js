/**
 * Copy to Clipboard Dynamic Action plug-in
 * Oracle APEX 26.1
 */
window.fi_jaris_copy_to_clipboard = window.fi_jaris_copy_to_clipboard || {};

(function (apex, $, clipboard) {
  "use strict";

  const LOG_PREFIX = "[Clipboard DA]";
  const TOOLTIP_CLASS = "clipboard-tooltip";

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

  clipboard.copy = function (settings, daConfig) {
    const affected$ = daConfig.affectedElements;

    apex.debug.info(
      LOG_PREFIX,
      "Copy to clipboard action fired.",
      {
        sourceAttribute: settings.sourceAttribute,
        affectedElementCount: affected$ ? affected$.length : 0
      }
    );

    if (!affected$ || !affected$.length) {
      apex.debug.error(
        LOG_PREFIX,
        "Copy to clipboard requires an affected element."
      );
      resume(daConfig, true);
      return;
    }

    if (affected$.length > 1) {
      apex.debug.warn(
        LOG_PREFIX,
        "Multiple affected elements found; only the first element will be copied.",
        affected$.length
      );
    }

    const source$ = affected$.eq(0);
    const anchor$ = daConfig.triggeringElement
      ? $(daConfig.triggeringElement)
      : source$;
    const text = source$.attr(settings.sourceAttribute);

    if (typeof text !== "string") {
      apex.debug.error(
        LOG_PREFIX,
        "Clipboard source attribute is missing from the affected element.",
        settings.sourceAttribute,
        source$[0]
      );
      resume(daConfig, true);
      return;
    }

    writeText(text)
      .then(function () {
        apex.debug.info(
          LOG_PREFIX,
          "Clipboard copy completed.",
          {
            sourceAttribute: settings.sourceAttribute,
            textLength: text.length
          }
        );

        showTooltip(
          anchor$.length ? anchor$ : source$,
          settings.tooltipMessage,
          settings.tooltipDuration
        );

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
