// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import 'jquery'
import 'popper.js'
import 'bootstrap'
import 'sweetalert2'
import "./scss/application"
import "./custom"
import "./devise"
import "trix"
import "@rails/actiontext"
import Swal from 'sweetalert2/dist/sweetalert2.js'

window.Swal = Swal

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("trix")
require("@rails/actiontext")

global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

$(function() {
  $('[data-toggle="offcanvas"]').on('click', function () {
    $('.offcanvas-collapse').toggleClass('open')
  })
})

$(document).ready( function(){
  if($('#current').length > 0){
    $('#current').text($('.count-textarea').val().length)

    $('.count-textarea').keyup(function(){
      var characterCount = $(this).val().length;
      $('#current').text(characterCount)
    });
  };

  $('.copy-url').click(function(){
    event.preventDefault();

    var url = $(this).attr('data-clipboard-text');
    navigator.clipboard.writeText(url);
  })
})
