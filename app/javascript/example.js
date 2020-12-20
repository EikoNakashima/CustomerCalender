
  // document.addEventListener('DOMContentLoaded', function() {
  //   if ( !!window.MSInputMethodContext && !!document.documentMode ) {
  //     return false;
  //   }
  // });

  // document.addEventListener('DOMContentLoaded', function() {
  //       const today = new Date()
  //   const nextMonth_lastDate = new Date(today.getFullYear(), (today.getMonth()+2), 0 );
  //   var calendarEl = document.getElementById('calendar');
  //   let calendarEl_posT = $(calendarEl).offset().top - 18;
  //   let calSettings;

  //       if ( window.innerWidth < 768 ) {
  //     calSettings = {initialView: 'listMonth'};
  //   } else {
  //     calSettings = {initialView: 'dayGridMonth'};
  //   }

  //   calSettings.endDate = `${nextMonth_lastDate.getFullYear()}-${zeroPadding(nextMonth_lastDate.getMonth() + 2, 2)}-01`;
  //   calSettings.area = 'east';
  //   $('#secCalHeader').append('<span class="area">関東</span>');

  //   const areas = {
  //     'east': '関東',
  //     'west': '関西',
  //   }

  //   const AreaSettingTrigger = document.getElementById('setEventCal');
  //   AreaSettingTrigger.addEventListener('click', function(e) {
  //     this.children[0].textContent = `${areas[calSettings.area]}の予定`;
  //     if ( calSettings.area == 'east' ) {
  //       calSettings.area = 'west';
  //     } else {
  //       calSettings.area = 'east';
  //     }
  //     $("#secCalHeader .area").text(areas[calSettings.area]);
  //     calendar.setOption('eventSources', gCal_for_event[calSettings.area]);
  //     calendar.render();
  //     setting_legend ( calSettings.area );
  //   });

  //       gCal_for_holiday = {
  //     googleCalendarId: 'ja.japanese#holiday@group.v.calendar.google.com',
  //     className: 'event_holiday'
  //   }

    
  //   gCal_for_event = {
  //     east: [{"googleCalendarId":"ja.japanese#holiday@group.v.calendar.google.com","className":"event_holiday"},{"googleCalendarId":"hanane.co.jp_fapj71pm0j7m5qhkr9nh0u3rns@group.calendar.google.com","className":"hanatome_hanane"},{"googleCalendarId":"hanane.co.jp_gpkc1jv76girtghcs37on7hfl4@group.calendar.google.com","className":"hanatome_teiban"},{"googleCalendarId":"c_rpk7d4rldjk757dgn9jace9i5k@group.calendar.google.com","className":"hanatome_teiban"},{"googleCalendarId":"hanane.co.jp_0v55i042svnpllrestommhap8o@group.calendar.google.com","className":"hanatome_event"}],
  //     west: [{"googleCalendarId":"ja.japanese#holiday@group.v.calendar.google.com","className":"event_holiday"},{"googleCalendarId":"c_04jmpc9v81l1vpgh96j97qfki0@group.calendar.google.com","className":"hanatome_teiban"},{"googleCalendarId":"c_9rurv3pr9r9drcdqh5jovlsfbk@group.calendar.google.com","className":"hanatome_event"}]    }
  //   cal_legend = {
  //     east: [{"label":"hanane","name":"hanatome_hanane"},{"label":"\u5354\u529b\u5e97","name":"hanatome_teiban"},{"label":"\u50ac\u4e8b","name":"hanatome_event"}],
  //     west: [{"label":"\u5354\u529b\u5e97","name":"hanatome_teiban"},{"label":"\u50ac\u4e8b","name":"hanatome_event"}]    }

  //       function setting_legend ( areaSetting ) {
  //     $('#FCLegend .fc-legend').each(function(){
  //       if ( $(this).data('area') == areaSetting ) {
  //         $(this).css('display', 'flex');
  //       } else {
  //         $(this).css('display', 'none');
  //       }
  //     })
  //   }

  //       var resoucesCount = 0;
  //   var calendar = new FullCalendar.Calendar(calendarEl, {
  //     locale: 'ja',
  //     height: 'auto',
  //     initialView: calSettings.initialView,
  //     firstDay: 1,
  //     validRange: function(nowDate) {
  //       return {
  //         start: '2020-07-01',
  //         end: calSettings.endDate
  //       };
  //     },
  //     customButtons: {
  //       nextWithScroll: {
  //         icon : 'fa-chevron-right',
  //         click: function(e) {
  //           calendar.next();
  //           $(window).scrollTop(calendarEl_posT)
  //         }
  //       },
  //       prevWithScroll: {
  //         icon : 'fa-chevron-left',
  //         click: function(e) {
  //           calendar.prev();
  //           $(window).scrollTop(calendarEl_posT)
  //         }
  //       }
  //     },
  //     headerToolbar: {
  //       left: "dayGridMonth,listMonth",
  //       center: "title",
  //       right: "today prev,next"
  //     },
  //     stickyHeaderDates: false,
  //     footerToolbar: {
  //       right: "prevWithScroll,nextWithScroll"
  //     },
  //     buttonText: {
  //       today: '今月',
  //       month: '月',
  //       week: '週',
  //       day: '日',
  //       list: 'リスト'
  //     },
  //     views: {
  //       dayGridMonth: {
  //         titleFormat: { year: 'numeric', month: 'numeric' },
  //       },
  //       listMonth: {
  //         titleFormat: { year: 'numeric', month: 'numeric' },
  //         listDayFormat: { month: 'numeric', day: 'numeric', weekday: 'narrow' },
  //         listDaySideFormat: false
  //       }
  //     },
  //     windowResize: function() {
  //       if ( window.innerWidth < 768 ) {
  //         calendar.changeView('listMonth');
  //       } else {
  //         calendar.changeView('dayGridMonth');
  //       }
  //     },
  //     dayCellContent: function(e) {
  //       e.dayNumberText = e.dayNumberText.replace('日', '');
  //     },
  //     viewDidMount : function(e) {
  //       if (!e.el.previousElementSibling ) {
  //         var legend = '<div id="FCLegend" class="fc-legend-box">';
  //         for (const [key, value] of Object.entries(cal_legend)) {
  //           legend += '<ul class="fc-legend" data-area="' + key + '">';
  //           for ( let i = 0; i < value.length; i++ ) {
  //             legend += `<li class="fc-legend-item ${value[i].name}"><label><input type="checkbox" checked />${value[i].label}</label></li>`
  //           }
  //           legend +=  '</ul>'
  //         }
  //         legend +=  '</div>'
  //         e.el.insertAdjacentHTML('beforebegin', legend);
  //         setting_legend ( calSettings.area );
  //       }
  //     },
  //     loading: function( isLoading ) {
  //       if ( isLoading ) {
  //         let d = '<div id="loading" class="loading"><div id="loading-anime" class="loading_inner"></div></div>'
  //         calendarEl.insertAdjacentHTML('beforebegin', d);                
  //         let loading = bodymovin.loadAnimation({
  //           container: document.getElementById('loading-anime'), 
  //           renderer: 'svg',
  //           loop: true,
  //           autoplay: true,
  //           path: 'https://hanane.co.jp/wp/wp-content/themes/hanane200602/assets/js/loading.json'
  //         });
  //       } else {
  //         document.getElementById('loading').remove();
  //       }
  //     },
  //     eventSourceSuccess : function(e) {
  //       resoucesCount++;
  //       console.log('eventSourceSuccess')
  //       if ( resoucesCount == gCal_for_event[calSettings.area].length ) {
  //         resoucesCount = 0;
  //       }
  //     },
  //     eventDidMount: function(e) {
  //       let el = e.el;
  //       e.el.addEventListener('click', function(){
  //         gtag('event', 'view_item', {'event_category': 'detail','event_label': e.event._def.title})
  //       })
  //       if ( el.classList.contains('event_holiday') ) {
  //         if ( e.view.type == "listMonth" ) {
  //                       el.previousSibling.classList.add('is_holiday');
  //                       let t = el.previousSibling.innerText;
  //           let h = el.previousSibling.innerHTML.split(t);
  //           t = t.slice(0, -1) + '・祝' + t.slice(-1);
  //           el.previousSibling.innerHTML = h[0] + t + h[1];

  //                       if (el.nextSibling == null || el.nextSibling.classList.contains('fc-list-day')) {
  //             el.previousSibling.remove();
  //           }
  //           el.remove()
  //         } else if ( e.view.type == "dayGridMonth" ) {
  //           el.closest('.fc-daygrid-day').classList.add('is_holiday');
  //         }
  //       } else {
  //         if ( e.view.type == "listMonth" ) {
  //           let t = el.querySelector('.fc-list-event-time');
  //           t.insertAdjacentHTML('afterbegin','<i class="far fa-clock">');
  //           let location = e.event._def.extendedProps.location;
  //           if ( location !== undefined ) {
  //             let cell = document.createElement('td');
  //             cell.classList.add('fc-list-event-location')
  //             cell.innerHTML = location;
  //             cell.insertAdjacentHTML('afterbegin','<i class="fas fa-map-marker-alt">');
  //             el.appendChild(cell);
  //           }
  //         }
  //       }
  //     },
  //     googleCalendarApiKey: 'AIzaSyDhHlPXOrozwvMTd-vnJMa-ZonSm3oZd-8',
  //     eventSources: gCal_for_event[calSettings.area],
  //     eventClick: function(info) {
  //       info.jsEvent.preventDefault();
  //       if (!info.el.classList.contains('is_holiday')) {
  //         show_eventDisp(info)
  //       }
  //     }
  //   });
  //   calendar.render();


  //   function show_eventDisp(info) {
  //     let event = info.event;
  //     let scrollPos = $(window).scrollTop();

  //     let title = event.title;
  //     let date = String(event.start.getMonth() + 1) + '/' + String(event.start.getDate());
  //     let time_start = zeroPadding(String(event.start.getHours()), 2) + ':' + zeroPadding(String(event.start.getMinutes()), 2);
  //     let time_end = zeroPadding(String(event.end.getHours()), 2) + ':' + zeroPadding(String(event.end.getMinutes()), 2);
  //     let location = event.extendedProps.location;
  //     let description = event.extendedProps.description;

  //     let ga_click_toMap = `gtag('event', 'view_outside', {'event_category': 'map','event_label': '${location}'})`;

  //     let regex1 = RegExp('<a href="', 'g');

  //           $('body').addClass('fixed').css({ top: -scrollPos, position: 'fixed'});
  //           if (description !== undefined) {
  //       if (description.search('<a href="') !== -1 && description.search('</a>') !== -1) {
  //         while ((regex1.exec(description)) !== null) {
  //           let splitCount = regex1.lastIndex - 'href="'.length;
  //           description = description.slice(0, splitCount) + 'target="_new" ' + description.slice(splitCount, description.length)
  //         }
  //       }
  //     }

  //     let content = '<div class="popup-body">';
  //     content += '<div class="popup_event_schedule">';
  //     content += `<div class="schedule_date far fa-calendar-alt">${date}</div>`;
  //     content += `<div class="schedule_time far fa-clock"><span class="time_start">${time_start}</span>`;
  //     content += `<span class="time_end">${time_end}</span></div>`;
  //     content += "</div>"
  //     content += `<h4 class="popup_event_title">${title}</h4>`;
  //     if ( location === 'オンライン' ) {
  //       content += '<div class="popup_event_location">';
  //       content += `<i class="fas fa-map-marker-alt"></i>${location}`;
  //       content += '</div>';
  //     } else if ( location !== undefined ) {
  //     content += '<div class="popup_event_location">';
  //     content += `<a href="https://www.google.com/maps/search/?api=1&query=${location}" class="address" onClick="${ga_click_toMap}" target="_new"><i class="fas fa-map-marker-alt"></i>${location}</a>`;
  //     content += `<a href="https://www.google.com/maps/search/?api=1&query=${location}" class="link_alt btn_altlink" onClick="${ga_click_toMap}" target="_new"><i class="fas fa-external-link-alt"></i>Google Map</a>`;
  //     content += '</div>';
  //     }
  //     if ( description !== undefined ) {
  //       content += `<div class="popup_event_description">${description.replace(/(\r\n|\n|\r)/gm, "<br />")}</div>`;
  //     }
  //     content += '</div>'
  //     content += '<div class="popup-footer"><button type="button" class="popup_close button_close">閉じる</button></div>'

  //     $(calendarEl).append(`<div id="eventPop" class="popup popup_event"><div class="popup_bg"></div><div class="popup_content">${content}</div></div>`);

  //     $(calendarEl).on("click", '.popup_bg, .popup_close', function () {
  //       $('#eventPop').remove();
  //       $('body').removeClass('fixed').css({ top: 0, position: 'static' });
  //       $(window).scrollTop(scrollPos);
  //     });

  //   }

  //   function zeroPadding(num, len){
  //     return ( Array(len).join('0') + num ).slice( -len );
  //   }

  // });