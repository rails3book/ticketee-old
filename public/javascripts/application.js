// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function add_another_file() {
  $.get("/assets/new", { number: $('input[type=file]').size() }, function(field) {
    $('#files').append(field);
  });
}