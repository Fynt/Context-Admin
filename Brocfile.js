/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');

var app = new EmberApp();

// Use `app.import` to add additional libraries to the generated
// output files.
//
// If you need to use different assets in different
// environments, specify an object as the first parameter. That
// object's keys should be the environment name and the values
// should be the asset to use in that environment.
//
// If the library that you are including contains AMD or ES6
// modules that you would like to import into your application
// please specify an object with the list of modules as keys
// along with the exports of each module as its value.

app.import('vendor/ember-data/ember-data.js');
app.import('vendor/blueimp-md5/js/md5.min.js');
app.import('vendor/moment/min/moment.min.js');
app.import('vendor/ember-forms/dist/ember_forms.js');
app.import('vendor/plupload/js/plupload.full.min.js');

module.exports = app.toTree();
