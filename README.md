# meteor-utility
A collection of utility modules.

## Installation

```
meteor add urbanetic:utility
```

### Meteor 1.2 and below

As of Meteor 1.3, npm has been updated to 2.14.22 which allows scoped packages. For all previous versions of Meteor, you needed to update the npm version used by meteor-tool to support installing the scoped NPM dependency (@urbanetic/utility), which needs NPM 2.7.0 or higher.

[https://github.com/meteor/meteor/issues/4985](https://github.com/meteor/meteor/issues/4985)

Find the Meteor NPM binary path which should be similar to:

```
$ cd ~/.meteor/packages/meteor-tool/1.1.8/mt-*/dev_bundle/lib
$ ../bin/npm install npm
```

The path may be visible in error messages if you still have an older version of NPM:

```
npm ERR! command "/Users/Aram/.meteor/packages/meteor-tool/.1.1.4.1cp6taf++os.osx.x86_64+web.browser+web.cordova/mt-os.osx.x86_64/dev_bundle/bin/node" "/Users/Aram/.meteor/packages/meteor-tool/.1.1.4.1cp6taf++os.osx.x86_64+web.browser+web.cordova/mt-os.osx.x86_64/dev_bundle/bin/npm" "install" "@urbanetic/utility@0.0.5"
npm ERR! cwd /Users/Aram/Development/Urbanetic/utility-js-npm-demo
npm ERR! node -v v0.10.36
npm ERR! npm -v 1.4.28
npm ERR! code E404
```

Here NPM is still 1.4.8 and should be ^2.7.0.
