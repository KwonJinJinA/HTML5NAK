var ConsoleRights = {};
ConsoleRights.curLv = global_obj.DEBUG_LEVEL ? global_obj.DEBUG_LEVEL: 0;
ConsoleRights.updateRight = function(lv) {
    ConsoleRights.curLv = lv;
};

ConsoleRights.resetConsole = function() {
    var preLogConsole = console.log;
    if (preLogConsole) {
        console.log = function(...args) {
            if (ConsoleRights.curLv >= 4) {
                preLogConsole(...args);
            }
        }
    }
    var preDebugConsole = console.debug;
    if (preDebugConsole) {
        console.debug = function(...args) {
            if (ConsoleRights.curLv >= 3) {
                preDebugConsole(...args);
            }
        }
    }
    var prewWarnConsole = console.warn;
    if (prewWarnConsole) {
        console.warn = function(...args) {
            if (ConsoleRights.curLv >= 2) {
                prewWarnConsole(...args);
            }
        }
    }
    var prewErrorConsole = console.error;
    if (prewErrorConsole) {
        console.error = function(...args) {
            if (ConsoleRights.curLv >= 1) {
                prewErrorConsole(...args);
            }
        }
    }
};
window['ConsoleRights'] = ConsoleRights;
