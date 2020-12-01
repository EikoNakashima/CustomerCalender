
import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';


document.addEventListener('DOMContentLoaded', function() {
  
  var calendarEl = document.getElementById('calendar');
  var calendar = new Calendar(calendarEl, {
    locale: 'ja',
    height: 'auto',
    headerToolbar: {
      left: "dayGridMonth,dayGridWeek,dayGridDay,listMonth",
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
    dayClick: function () {
      //alert('日付クリックイベント');
    },
    // defaultView: 'month',
    // // 終日スロットを表示
    // allDaySlot: true,
    // // 終日スロットのタイトル
    // allDayText: '終日',
    // // スロットの時間の書式
    // axisFormat: 'H(:mm)',
    // // スロットの分
    // slotMinutes: 15,
    // // 選択する時間間隔
    // snapMinutes: 15,
    // // TODO よくわからない
    // //defaultEventMinutes: 120,
    // // スクロール開始時間
    // firstHour: 9,
    // // 最小時間
    // minTime: 6,
    // // 最大時間
    // maxTime: 20,
    // // 表示する年
    // year: 2012,
    // // 表示する月
    // month: 12,
    // // 表示する日
    // day: 31,
    // // 時間の書式
    // timeFormat: 'H(:mm)',
    // // 列の書式
    // columnFormat: {
    //   month: 'ddd',    // 月
    //   week: "d'('ddd')'", // 7(月)
    //   day: "d'('ddd')'" // 7(月)
    // },
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

