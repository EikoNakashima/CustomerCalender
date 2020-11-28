
import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';


document.addEventListener('DOMContentLoaded', function() {
  
  var calendarEl = document.getElementById('calendar');
  var calendar = new Calendar(calendarEl, {
    locale: 'ja',
    height: 'auto',
    headerToolbar: {
      left: "dayGridMonth,listMonth",
      center: "title",
      right: "today prev,next"
    },
    buttonText: {
      today: '今月',
      month: '月',
      list: 'リスト',
    },
    dayCellContent: function(e) {
      e.dayNumberText = e.dayNumberText.replace('日', '');
    },
    plugins: [ dayGridPlugin, interactionPlugin ]
  });

  calendar.render();
});

document.getElementById("confirm").addEventListener('click', function()　{
  calendar.refetchEvents();
  calendar.render();
});

