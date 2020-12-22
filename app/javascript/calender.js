
import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';
import listPlugin from '@fullcalendar/list';
import timeGridPlugin from '@fullcalendar/timegrid';




document.addEventListener('DOMContentLoaded', function() {
  
  let calendarEl = document.getElementById('calendar');
  let calendar = new Calendar(calendarEl, {
    navLinks: true,
    editable: true,
    nowIndicator: true,
    initialView: 'dayGridMonth',
   
    events: '/events.json',
    
    locale: 'ja',
    timeZone: 'Asia/Tokyo',
    height: 'auto',
    headerToolbar: {
      left: "dayGridMonth,timeGridWeek,timeGridDay,listMonth",
      center: "title",
      right: "today prev,next"
    },
    buttonText: {
      today: '今日',
      month: '月',
      list: 'リスト',
      week: '週',
      day: '日',
    },
    views: {
      timeGridWeek: {
        slotMinTime: '07:00:00',
        slotMaxTime: '22:00:00'
      },
      timeGridDay: {
        slotMinTime: '07:00:00',
        slotMaxTime: '22:00:00'
      }
    },
    eventClick: function(event) {
    },
    dayCellContent: function(e) {
      e.dayNumberText = e.dayNumberText.replace('日', '');
    },
    plugins: [ dayGridPlugin, timeGridPlugin, interactionPlugin, listPlugin,  ]
  });



  calendar.render();

  
});

