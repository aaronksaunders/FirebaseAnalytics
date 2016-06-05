var exec = require('cordova/exec');

exports.initialize = function (arg0, success, error) {
    exec(success, error, "FirebaseAnalytics", "initialize", [arg0]);
};

exports.setUserProperty = function (arg0, arg1, success, error) {
    exec(success, error, "FirebaseAnalytics", "setUserProperty", [arg0, arg1]);
};

exports.logEventWithName = function (arg0, arg1, arg2, success, error) {
    exec(success, error, "FirebaseAnalytics", "logEventWithName", [arg0, arg1, arg2]);
};
