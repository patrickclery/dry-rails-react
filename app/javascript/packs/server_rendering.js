// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require react
//= require jquery
//= require popper.js
//= require bootstrap
//= require stylesheets/application
//= require channels

// This was required to be here (and required above) to work on client-side rendering
import 'stylesheets/application'

var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);

