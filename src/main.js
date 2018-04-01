const isMeteor = typeof Meteor !== 'undefined';
const utility = require('@urbanetic/utility');
const Log = utility.Log;

// Log is already defined in the logging package, so we define a different global variable.
if (isMeteor) {
  delete utility.Log;
  global.Logger = Log;
}

// The Window interface is global so merge methods.
if (typeof Window !== 'undefined') {
  _.extend(Window, utility.Window);
  delete utility.Window;
}
// Prevent overriding existing globals.
_.defaults(global, utility);

if (isMeteor) {
  if (Meteor.isServer) {
    const logLevel = process.env.LOG_LEVEL;
    if (logLevel != null) {
      console.log('Log level:', logLevel);
      Log.setLevel(logLevel);
    }
  } else if (Meteor.isCordova) {
    // Cordova console package exists only once 'deviceready' event is fired.
    $(document).on('deviceready', function() {
      const platform = device.platform.toLowerCase();
      Log.info('Cordova logger started on platform:', platform);
    });
  }
}
