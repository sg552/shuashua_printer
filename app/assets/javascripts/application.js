//= require jquery
//= require jquery_ujs
//= require bootstrap/bootstrap-transition
//= require bootstrap/bootstrap-alert
//= require bootstrap/bootstrap-modal
//= require bootstrap/bootstrap-dropdown
//= require bootstrap/bootstrap-scrollspy
//= require bootstrap/bootstrap-tab
//= require bootstrap/bootstrap-tooltip
//= require bootstrap/bootstrap-popover
//= require bootstrap/bootstrap-button
//= require bootstrap/bootstrap-collapse
//= require bootstrap/bootstrap-carousel
//= require bootstrap/bootstrap-typeahead
//= require jquery-ui-1.8.18.custom.min.js
//= require jquery.maphilight.js
//= require jquery.cookie.js
//= require jquery.cookie.array_support.js
//= require my_utilities
//

function add_to_list(area_object){
  var point_list_in_cookie = new cookieList("point_list_in_cookie")
  point_list_in_cookie.add($(area_object).attr("point_id"))
  show_in_preview(area_object, $(area_object).parent().siblings(".preview") )
}

function show_in_preview(area_object, preview_div){
  point = $(area_object)
  preview_div.children('ol').append("<li>" + point.attr("point_name") + ", " + point.attr("point_position")  + "</li>")
}

function restart(){
  $.cookie("point_list_in_cookie", null)
  selected_tab_index = $("#tabs").tabs('option', 'selected');
  selected_tab_id = $($('#tabs div.ui-tabs-panel')[selected_tab_index]).attr("id")
  selector = "#" + selected_tab_id + " .preview ol";
  $(selector).html("")
}
