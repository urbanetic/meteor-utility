var exports = require('@urbanetic/utility');
var Log = exports.Log;
delete Log;
_.extend(global, exports);

if (typeof Meteor !== 'undefined') {
  // Log is already defined in the logging package, so we define a different global variable.
  global.Logger = Log;
  if (Meteor.isServer) {
    var logLevel = process.env.LOG_LEVEL;
    if (logLevel != null) {
      console.log('Log level:', logLevel);
      Log.setLevel(logLevel);
    }
  } else if (Meteor.isCordova) {
    // Cordova console package exists only once 'deviceready' event is fired.
    $(document).on('deviceready', function() {
      console = window.console;
      var platform = device.platform.toLowerCase();
      Log.info('Cordova logger started on platform:', platform);
    });
  }
}
