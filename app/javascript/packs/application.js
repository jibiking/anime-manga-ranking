

//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require jquery
//= require jquery_ujs
//= require rails_ujs

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "./channels"
import "jquery"
import "./common.js"

import '@fortawesome/fontawesome-free/js/all';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// 追記
require("turbolinks").start()
require("@rails/activestorage").start()
require('jquery')