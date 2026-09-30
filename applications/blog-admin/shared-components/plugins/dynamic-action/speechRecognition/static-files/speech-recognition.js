/**
 * Speech Recognition Dynamic Action plug-in
 * Oracle APEX 26.1+
 */
window.fi_jaris_speech_recognition = window.fi_jaris_speech_recognition || {};

(function (apex, $, speechRecognition) {
  "use strict";

  const LOG_PREFIX = "[Speech Recognition DA]";
  const EVENT_PREFIX = "fi-jaris-speech";
  const instances = new WeakMap();

  function resume(daConfig, errorOccurred) {
    if (typeof daConfig.resumeCallback === "function") {
      apex.da.resume(daConfig.resumeCallback, errorOccurred);
    }
  }

  function getSpeechRecognitionConstructor() {
    return window.SpeechRecognition || window.webkitSpeechRecognition;
  }

  function getButton$(element) {
    const element$ = $(element);

    if (!element$.length) {
      return $();
    }

    return element$.is(":button") ? element$ : element$.closest("button");
  }

  function triggerEvent(targetElement, eventName, detail) {
    $(targetElement).trigger(EVENT_PREFIX + "-" + eventName, [detail]);
  }

  function updateButtonState(state, recording) {
    const button$ = state.button$;
    const settings = state.settings;

    if (!button$ || !button$.length) {
      return;
    }

    if (settings.recordingButtonClass) {
      button$.toggleClass(settings.recordingButtonClass, recording);
    }

    const icon$ = button$.find("span.t-Icon").first();

    if (!icon$.length) {
      if (!state.iconWarningLogged) {
        apex.debug.warn(
          LOG_PREFIX,
          "Trigger button has no span.t-Icon; recording state class is updated but icon classes are not.",
          button$[0]
        );
        state.iconWarningLogged = true;
      }
      return;
    }

    if (settings.idleIconClass) {
      icon$.toggleClass(settings.idleIconClass, !recording);
    }

    if (settings.recordingIconClass) {
      icon$.toggleClass(settings.recordingIconClass, recording);
    }

    if (settings.animationClass) {
      icon$.toggleClass(settings.animationClass, recording);
    }
  }

  function formatTranscript(transcript, settings) {
    let value = transcript.trim();

    if (!value) {
      return "";
    }

    if (settings.capitalizeFirst) {
      value = value.charAt(0).toUpperCase() + value.slice(1);
    }

    if (settings.appendPeriod && !/[.!?…]$/u.test(value)) {
      value += ".";
    }

    return value;
  }

  function appendTranscript(targetElement, transcript) {
    const currentValue = $v(targetElement);
    const currentText = currentValue == null ? "" : String(currentValue);
    const separator = currentText && !/\s$/u.test(currentText) ? " " : "";

    $s(targetElement, currentText + separator + transcript);
  }

  function configureRecognition(state) {
    const settings = state.settings;
    const speech = state.speech;

    speech.continuous = settings.continuous;
    speech.interimResults = false;
    speech.maxAlternatives = 1;
    speech.lang = settings.language ||
      document.documentElement.lang ||
      navigator.language ||
      navigator.userLanguage ||
      "en-US";

    apex.debug.info(
      LOG_PREFIX,
      "Speech recognition configuration applied.",
      {
        continuous: speech.continuous,
        language: speech.lang,
        clearPreviousText: settings.clearPreviousText,
        capitalizeFirst: settings.capitalizeFirst,
        appendPeriod: settings.appendPeriod
      }
    );
  }

  function createState(targetElement, settings, button$) {
    const SpeechRecognition = getSpeechRecognitionConstructor();
    const speech = new SpeechRecognition();
    const state = {
      targetElement: targetElement,
      speech: speech,
      settings: settings,
      button$: button$,
      status: "idle",
      iconWarningLogged: false
    };

    configureRecognition(state);

    speech.onresult = function (event) {
      const transcripts = [];

      for (let i = event.resultIndex; i < event.results.length; i += 1) {
        const result = event.results[i];

        if (!result || !result[0] || !result.isFinal) {
          continue;
        }

        const transcript = formatTranscript(
          result[0].transcript,
          state.settings
        );

        if (!transcript) {
          continue;
        }

        transcripts.push({
          text: transcript,
          confidence: result[0].confidence
        });
      }

      transcripts.forEach(function (result) {
        appendTranscript(targetElement, result.text);

        apex.debug.info(
          LOG_PREFIX,
          "Speech transcript appended.",
          {
            transcriptLength: result.text.length,
            confidence: result.confidence
          }
        );

        triggerEvent(targetElement, "result", {
          transcript: result.text,
          confidence: result.confidence
        });
      });

      if (!transcripts.length) {
        apex.debug.warn(
          LOG_PREFIX,
          "Speech recognition result contained no final transcript.",
          event.resultIndex
        );
      }
    };

    speech.onstart = function () {
      if (state.status === "stopping") {
        try {
          speech.stop();
        } catch (error) {
          apex.debug.warn(
            LOG_PREFIX,
            "Speech recognition was stopping when start event fired.",
            error
          );
        }
        return;
      }

      state.status = "recording";

      if (state.settings.clearPreviousText) {
        $s(targetElement, "");
      }

      updateButtonState(state, true);

      apex.debug.info(
        LOG_PREFIX,
        "Speech recognition started.",
        {
          targetElement: targetElement,
          language: speech.lang
        }
      );

      triggerEvent(targetElement, "start", {
        language: speech.lang
      });
    };

    speech.onend = function () {
      state.status = "idle";
      updateButtonState(state, false);

      apex.debug.info(
        LOG_PREFIX,
        "Speech recognition ended.",
        targetElement
      );

      triggerEvent(targetElement, "end", {});
    };

    speech.onerror = function (event) {
      const detail = {
        error: event.error,
        message: event.message
      };

      if (event.error === "no-speech" || event.error === "aborted") {
        apex.debug.warn(
          LOG_PREFIX,
          "Speech recognition warning.",
          detail
        );
      } else {
        apex.debug.error(
          LOG_PREFIX,
          "Speech recognition error.",
          detail
        );
      }

      triggerEvent(targetElement, "error", detail);
    };

    instances.set(targetElement, state);

    apex.debug.info(
      LOG_PREFIX,
      "Speech recognition instance initialized.",
      {
        targetId: targetElement.id,
        targetNodeName: targetElement.nodeName
      }
    );

    return state;
  }

  speechRecognition.toggle = function (settings, daConfig) {
    const SpeechRecognition = getSpeechRecognitionConstructor();
    const affected$ = daConfig.affectedElements;

    apex.debug.info(
      LOG_PREFIX,
      "Speech recognition action fired.",
      {
        affectedElementCount: affected$ ? affected$.length : 0,
        continuous: settings.continuous,
        language: settings.language
      }
    );

    if (!SpeechRecognition) {
      apex.debug.error(
        LOG_PREFIX,
        "Speech Recognition API is not available in this browser."
      );
      resume(daConfig, true);
      return;
    }

    if (!affected$ || !affected$.length) {
      apex.debug.error(
        LOG_PREFIX,
        "Speech Recognition requires an affected element."
      );
      resume(daConfig, true);
      return;
    }

    if (affected$.length > 1) {
      apex.debug.warn(
        LOG_PREFIX,
        "Multiple affected elements found; only the first element will receive speech text.",
        affected$.length
      );
    }

    const targetElement = affected$.eq(0)[0];
    const button$ = getButton$(daConfig.triggeringElement);
    let state = instances.get(targetElement);

    if (!button$.length) {
      apex.debug.warn(
        LOG_PREFIX,
        "Triggering element is not a button; speech recognition will work without button-state styling.",
        daConfig.triggeringElement
      );
    }

    if (!state) {
      state = createState(targetElement, settings, button$);
    } else {
      if (
        button$.length &&
        state.button$ &&
        state.button$.length &&
        state.button$[0] !== button$[0]
      ) {
        updateButtonState(state, false);
      }

      state.settings = settings;

      if (button$.length) {
        state.button$ = button$;
        updateButtonState(state, state.status === "recording");
      }

      if (state.status === "idle") {
        configureRecognition(state);
      }
    }

    try {
      if (state.status === "idle") {
        state.status = "starting";
        state.speech.start();

        apex.debug.info(
          LOG_PREFIX,
          "Speech recognition start requested."
        );
      } else if (state.status === "starting") {
        state.status = "stopping";
        state.speech.abort();

        apex.debug.info(
          LOG_PREFIX,
          "Speech recognition start cancelled."
        );
      } else if (state.status === "recording") {
        state.status = "stopping";
        state.speech.stop();

        apex.debug.info(
          LOG_PREFIX,
          "Speech recognition stop requested."
        );
      } else {
        apex.debug.warn(
          LOG_PREFIX,
          "Speech recognition stop is already in progress."
        );
      }

      resume(daConfig, false);
    } catch (error) {
      state.status = "idle";
      updateButtonState(state, false);

      apex.debug.error(
        LOG_PREFIX,
        "Speech recognition start/stop failed.",
        error
      );

      resume(daConfig, true);
    }
  };
})(
  apex,
  apex.jQuery,
  window.fi_jaris_speech_recognition
);
