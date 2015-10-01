var isMeteor = typeof Meteor !== 'undefined';
var exports = require('@urbanetic/utility');
var Log = exports.Log;

// Log is already defined in the logging package, so we define a different global variable.
if (isMeteor) {
  delete exports.Log;
  global.Logger = Log;
}

// The Window interface is global so merge methods.
if (typeof Window !== 'undefined') {
  _.extend(Window, exports.Window);
  delete exports.Window;
}
// Prevent overriding existing globals.
_.defaults(global, exports);

if (isMeteor) {
  if (Meteor.isServer) {
    var logLevel = process.env.LOG_LEVEL;
    if (logLevel != null) {
      console.log('Log level:', logLevel);
      Log.setLevel(logLevel);
    }
  } else if (Meteor.isCordova) {
    // Cordova console package exists only once 'deviceready' event is fired.
    $(document).on('deviceready', function() {
      var platform = device.platform.toLowerCase();
      Log.info('Cordova logger started on platform:', platform);
    });
  }
}
