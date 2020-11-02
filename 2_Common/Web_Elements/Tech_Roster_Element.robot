*** Variables ***
${TECHNICIAN_ROSTER_HEADER}      //h5[contains(., 'Technician Roster')]
${TECH_ROSTER_CALENDAR_BTN}     //button[contains(@class, 'calendar')]/i[@class='icon-calendar']
${MULTI_MONTHS_CALENDAR_HEADER}         //div[contains(@class, 'modal-header') and contains(., 'Multi Months')]
${TODAY_DATE}                   //div[contains(@class, 'dp-today')]
${CURR_CALENDAR_MONTH}         (//div[contains(@class, 'dp-month-name')])[1]
${NEXT_1_MONTH_CALENDAR}         (//div[contains(@class, 'dp-month-name')])[2]
${NEXT_2_MONTH_CALENDAR}         (//div[contains(@class, 'dp-month-name')])[3]
${MONTH_LIST}                   //select[@title='Select month']
${YEAR_LIST}                    //select[@title='Select year']
${SET_BUTTON}                   //button[contains(., 'Set')]
${CURRENT_VIEW_DATE_TEXT}            //div[contains(@class, 'dp-day') ]/div[contains(@ng-reflect-selected, 'true')]
${NEXT_MONTH_BTN}                   //button[@title='Next month']
${MULTI_MONTHS_CANCEL_BTN}          //button[contains(., 'Cancel')]
${PREVIOUS_MONTH_BTN}               //button[@title='Previous month']
${WEEK_SCHEDULE_HEADER}             //div[contains(@class, 'calendar-header')]/h4
${FIRST_DAY_SUNDAY}                 //div[contains(@class, 'cal-day-headers')]/div[1][contains(., 'Sunday')]
