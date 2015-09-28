// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
// require fullcalendar
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= bootstrap-datepicker
//= require bootstrap

//= require_tree .
$(document).ready(function(){
      // page is now ready, initialize the calendar...
      // $('#new_event').click(function(event) {
      //   event.preventDefault();
      //   var url = $(this).attr('href');
      //   $.ajax({
      //     url: url,
      //     beforeSend: function() {
      //       $('#loading').show();
      //     },
      //     complete: function() {
      //       $('#loading').hide();
      //     },
      //     success: function(data) {
      //       $('#create_event').replaceWith(data['form']);
      //       $('#create_event_dialog').dialog({
      //         title: 'New Event',
      //         modal: true,
      //         width: 500,
      //         close: function(event, ui) { $('#create_event_dialog').dialog('destroy') }
      //       });
      //     }
      //   });
      // });

      // $('#calendar').fullCalendar({
      //     editable: true,
      //     header: {
      //         left: 'prev,next today',
      //         center: 'title',
      //         right: 'month,agendaWeek,agendaDay'
      //     },
      //     defaultView: 'month',
      //     height: 500,
      //     slotMinutes: 15,
      //     loading: function(bool){
      //         if (bool) 
      //             $('#loading').show();
      //         else 
      //             $('#loading').hide();
      //     },
      //     events: "/events/get_events",
      //     timeFormat: 'h:mm t{ - h:mm t} ',
      //     dragOpacity: "0.5",
      //     eventDrop: function(event, dayDelta, minuteDelta, allDay, revertFunc){
      //             moveEvent(event, dayDelta, minuteDelta, allDay);
      //     },
      //     eventResize: function(event, dayDelta, minuteDelta, revertFunc){
      //             resizeEvent(event, dayDelta, minuteDelta);
      //     },
      //     eventClick: function(event, jsEvent, view){
      //         showEventDetails(event);
      //     },
      // });
  });