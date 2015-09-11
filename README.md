# meteor-utility
A collection of utility modules.

## Installation

For now, you must update the npm version used by meteor-tool to support installing the scoped NPM dependency (@urbanetic/utility).

Find the Meteor NPM binary path which should be similar to:

```
$ cd ~/.meteor/packages/meteor-tool/.1.1.4.1cp6taf++os.osx.x86_64+web.browser+web.cordova/mt-os.osx.x86_64/dev_bundle/bin
$ ./npm update npm -g
```

The path may be visible in error messages if you still have an older version of NPM:

```
npm ERR! command "/Users/Aram/.meteor/packages/meteor-tool/.1.1.4.1cp6taf++os.osx.x86_64+web.browser+web.cordova/mt-os.osx.x86_64/dev_bundle/bin/node" "/Users/Aram/.meteor/packages/meteor-tool/.1.1.4.1cp6taf++os.osx.x86_64+web.browser+web.cordova/mt-os.osx.x86_64/dev_bundle/bin/npm" "install" "@urbanetic/utility@0.0.5"
npm ERR! cwd /Users/Aram/Development/Urbanetic/utility-js-npm-demo
npm ERR! node -v v0.10.36
npm ERR! npm -v 1.4.28
npm ERR! code E404
```

Here NPM is still 1.4.8 and should be ^2.12.0.
