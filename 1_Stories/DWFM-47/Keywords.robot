*** Settings ***
Library           String
Library           Collections
Resource          ../../2_Common/Generic_Resources/dwfm_resources.robot

*** Keywords ***
Access Technician Roster From Workforce
    Access Sub Menu From Workforce      Resource Management     Technician Roster
    Page Should Contain Element     ${TECHNICIAN_ROSTER_HEADER}


Click Calendar button in Technician Roster Page
    Click Element    ${TECH_ROSTER_CALENDAR_BTN}

Verify pop up calendar should display 3 months in sequence from the current month
    Wait Until Element Is Visible       ${MULTI_MONTHS_CALENDAR_HEADER}     ${visibilityTimeOut}
    Page Should Contain Element         ${TODAY_DATE}
    Verify Current Date Is Equal to System Date
    Verify Next Month Calendar Is Visible
    Verify Next 2 Months Calendar Is Visible

Verify Current Date Is Equal to System Date
    Page Should Contain Element    ${CURR_CALENDAR_MONTH}
    ${todaysDate} =     Get Element Attribute    ${TODAY_DATE}      aria-label
    log     ${todaysDate}
    ${systemDate} =     Get Current Date
    ${convertSysDateFormat} =   Convert Date    ${systemDate}   result_format=%A, %B %d, %Y
    Should Be Equal     ${todaysDate}   ${convertSysDateFormat}
    ${currentMonth} =   Convert Date      ${todaysDate}      result_format=%B %Y
    ${currentCalendarMonth} =   Get Text   ${CURR_CALENDAR_MONTH}
    log    ${currentCalendarMonth}
    ${strippedCurrCalMonth} =   Strip String    ${currentCalendarMonth}
    Should Be Equal    ${strippedCurrCalMonth}      ${currentCalendarMonth}

Verify Next Month Calendar Is Visible
    Page Should Contain Element    ${NEXT_1_MONTH_CALENDAR}
    ${next_30days_Date} =   Get Current Date    result_format=%B %Y     increment=30 days
    log     ${next_30days_Date}
    ${next1MonthHeader} =   Get Text   ${NEXT_1_MONTH_CALENDAR}
    ${strippedNext1Month} =   Strip String    ${next1MonthHeader}
    log      ${strippedNext1Month}
    Should Be Equal     ${strippedNext1Month}       ${next_30days_Date}

Verify Next 2 Months Calendar Is Visible
    Page Should Contain Element    ${NEXT_2_MONTH_CALENDAR}
   ${next_60days_Date} =   Get Current Date    result_format=%B %Y     increment=60 days
    log     ${next_60days_Date}
    ${next2MonthHeader} =   Get Text   ${NEXT_2_MONTH_CALENDAR}
    ${strippedNext2Month} =   Strip String    ${next2MonthHeader}
    log      ${strippedNext2Month}
    Should Be Equal     ${strippedNext2Month}       ${next_60days_Date}
    Capture Page Screenshot

Choose Future Month In Calendar
    Click Calendar button in Technician Roster Page
     Wait Until Element Is Visible       ${MULTI_MONTHS_CALENDAR_HEADER}     ${visibilityTimeOut}
    Select From List By Value       ${MONTH_LIST}       ${MONTH_DATA}
    Select From List By Value       ${YEAR_LIST}        ${YEAR_DATA}
    ${choosenDate} =    Get Text    //div[contains(@class, 'dp-day') and contains(@aria-label, "'${MONTH_STRING_DATA} ${DAY_DATA}'")]
    Set Suite Variable      ${CHOOSEN_DATE}     ${choosenDate}
    Click Element                   //div[contains(@class, 'dp-day') and contains(@aria-label, "'${MONTH_STRING_DATA} ${DAY_DATA}'")]
    Click Element                   ${SET_BUTTON}
    Wait Until Element Is Not Visible       ${SET_BUTTON}       ${visibilityTimeOut}


Verify Date Displayed in TimeTable
    ${convertChoosenDate} =   Convert Date    ${CHOOSEN_DATE}   result_format=%b %d
    Wait Until Page Contains Element    //div[contains(@class, 'cal-header')]/span[contains(., '${convertChoosenDate}')]      ${visibilityTimeOut}

Verify 3 months view should base on which month is the user currently viewing
    Wait Until Element Is Visible       ${MULTI_MONTHS_CALENDAR_HEADER}     ${visibilityTimeOut}
    Verify Currently View Date Is Selected
    Verify Next Month Calendar From Current View Date Is Visible
    Verify Next 2 Months Calendar From Current View Date Is Visible
    Capture Page Screenshot

Verify Currently View Date Is Selected
    Page Should Contain Element     //div[contains(@class, 'dp-day') ]/div[contains(@ng-reflect-selected, 'true') and contains(., '${DAY_DATA}')]
    ${currentViewDate} =     Get Element Attribute    ${CURRENT_VIEW_DATE_TEXT}      aria-label
    log  ${currentViewDate}
    set suite variable      ${CURRENT_VIEW_DATE}        ${currentViewDate}

Verify Next Month Calendar From Current View Date Is Visible
    Page Should Contain Element    ${NEXT_1_MONTH_CALENDAR}
    ${next_30days_Date} =   Add Time To Date    ${CURRENT_VIEW_DATE}    result_format=%B %Y     increment=30 days
    log     ${next_30days_Date}
    ${next1MonthHeader} =   Get Text   ${NEXT_1_MONTH_CALENDAR}
    ${strippedNext1Month} =   Strip String    ${next1MonthHeader}
    log      ${strippedNext1Month}
    Should Be Equal     ${strippedNext1Month}       ${next_30days_Date}

Verify Next 2 Months Calendar From Current View Date Is Visible
    Page Should Contain Element    ${NEXT_2_MONTH_CALENDAR}
    ${next_60days_Date} =   Add Time To Date    ${CURRENT_VIEW_DATE}    result_format=%B %Y     increment=60 days
    log     ${next_60days_Date}
    ${next2MonthHeader} =   Get Text   ${NEXT_2_MONTH_CALENDAR}
    ${strippedNext2Month} =   Strip String    ${next2MonthHeader}
    log      ${strippedNext2Month}
    Should Be Equal     ${strippedNext2Month}       ${next_60days_Date}

At the pop up Calendar, click Next button to move to next month
    Click Element    ${NEXT_MONTH_BTN}

Verify The pop up Calendar should move to next month
    Verify First Calendar after click Next
    Verify Second Calendar after click Next
    Verify Third Calendar after click Next

Verify First Calendar after click Next
    Page Should Contain Element    ${CURR_CALENDAR_MONTH}
    ${next_30days_Date} =   Get Current Date    result_format=%B %Y     increment=30 days
    log     ${next_30days_Date}
    ${afterclicknextMonthHeader} =   Get Text   ${CURR_CALENDAR_MONTH}
    ${afterclickNextMonth} =   Strip String    ${afterclicknextMonthHeader}
    log      ${afterclickNextMonth}
    Should Be Equal     ${afterclickNextMonth}      ${next_30days_Date}

Verify Second Calendar after click Next
    Page Should Contain Element    ${NEXT_1_MONTH_CALENDAR}
    ${next_60days_Date} =   Get Current Date    result_format=%B %Y     increment=60 days
    log     ${next_60days_Date}
    ${afterclicknext1MontHeader} =   Get Text   ${NEXT_1_MONTH_CALENDAR}
    ${strippedafterclicknext1MontHeader} =   Strip String    ${afterclicknext1MontHeader}
    log      ${strippedafterclicknext1MontHeader}
    Should Be Equal     ${strippedafterclicknext1MontHeader}       ${next_60days_Date}

Verify Third Calendar after click Next
    Page Should Contain Element    ${NEXT_2_MONTH_CALENDAR}
    ${next_90days_Date} =   Get Current Date    result_format=%B %Y     increment=90 days
    log     ${next_90days_Date}
    ${afterclicknext2MontHeader} =   Get Text   ${NEXT_2_MONTH_CALENDAR}
    ${strippedafterclicknext2MontHeader} =   Strip String    ${afterclicknext2MontHeader}
    log      ${strippedafterclicknext2MontHeader}
    Should Be Equal     ${strippedafterclicknext2MontHeader}       ${next_90days_Date}

At the pop up Calendar, click Previous button to move to next month
    Click Element    ${PREVIOUS_MONTH_BTN}
    Click Element    ${PREVIOUS_MONTH_BTN}


Verify The pop up Calendar should move to previous month
    Verify First Calendar after click Previous
    Verify Second Calendar after click Previous
    Verify Third Calendar after click Previous

Verify First Calendar after click Previous
    Page Should Contain Element    ${CURR_CALENDAR_MONTH}
    ${prev_30days_Date} =   Get Current Date    result_format=%B %Y     increment=-30 days
    log     ${prev_30days_Date}
    ${afterclickprevMonthHeader} =   Get Text   ${CURR_CALENDAR_MONTH}
    ${afterclickPrevMonth} =   Strip String    ${afterclickprevMonthHeader}
    log      ${afterclickPrevMonth}
    Should Be Equal     ${afterclickprevMonthHeader}      ${prev_30days_Date}

Verify Second Calendar after click Previous
    Page Should Contain Element    ${NEXT_1_MONTH_CALENDAR}}
    ${todaysDate} =     Get Element Attribute    ${TODAY_DATE}      aria-label
    log     ${todaysDate}
    ${systemDate} =     Get Current Date
    ${convertSysDateFormat} =   Convert Date    ${systemDate}   result_format=%A, %B %d, %Y
    Should Be Equal     ${todaysDate}   ${convertSysDateFormat}
    ${currentMonth} =   Convert Date      ${todaysDate}      result_format=%B %Y
    ${currentCalendarMonth} =   Get Text   ${NEXT_1_MONTH_CALENDAR}
    log    ${currentCalendarMonth}
    ${strippedCurrCalMonth} =   Strip String    ${currentCalendarMonth}
    Should Be Equal    ${strippedCurrCalMonth}      ${currentCalendarMonth}

Verify Third Calendar after click Previous
    Page Should Contain Element    ${NEXT_2_MONTH_CALENDAR}
    ${next_30days_Date} =   Get Current Date    result_format=%B %Y     increment=30 days
    log     ${next_30days_Date}
    ${afterclickprev1MontHeader} =   Get Text   ${NEXT_1_MONTH_CALENDAR}
    ${strippedafterclickprev1MontHeader} =   Strip String    ${afterclickprev1MontHeader}
    log      ${strippedafterclickprev1MontHeader}
    Should Be Equal     ${strippedafterclickprev1MontHeader}       ${next_30days_Date}

After selection, observe the weekly roster and the weekly title
    Verify Date Displayed in TimeTable
    ${weekScheduleText} =   Get Text        ${WEEK_SCHEDULE_HEADER}
    log     ${weekScheduleText}

Observe the day that starts the weekly roster
    The weekly roster view should start with Sunday

The weekly roster view should start with Sunday
    Page Should Contain Element    ${FIRST_DAY_SUNDAY}

Choose Second Future Month In Calendar
    Click Calendar button in Technician Roster Page
     Wait Until Element Is Visible       ${MULTI_MONTHS_CALENDAR_HEADER}     ${visibilityTimeOut}
    Select From List By Value       ${MONTH_LIST}       ${MONTH_DATA2}
    Select From List By Value       ${YEAR_LIST}        ${YEAR_DATA2}
    ${choosenDate2} =    Get Text    //div[contains(@class, 'dp-day') and contains(@aria-label, "'${MONTH_STRING_DATA2} ${DAY_DATA2}'")]
    Set Suite Variable      ${CHOOSEN_DATE2}     ${choosenDate2}
    Click Element                   //div[contains(@class, 'dp-day') and contains(@aria-label, "'${MONTH_STRING_DATA2} ${DAY_DATA2}'")]
    Click Element                   ${SET_BUTTON}
    Wait Until Element Is Not Visible       ${SET_BUTTON}       ${visibilityTimeOut}

After selection, observe the weekly roster and the weekly title2
    Verify Date Displayed in TimeTable2
    ${weekScheduleText2} =   Get Text        ${WEEK_SCHEDULE_HEADER}
    log     ${weekScheduleText2}

Verify Date Displayed in TimeTable2
    ${convertChoosenDate2} =   Convert Date    ${CHOOSEN_DATE2}   result_format=%b %d
    Wait Until Page Contains Element    //div[contains(@class, 'cal-header')]/span[contains(., '${convertChoosenDate2}')]      ${visibilityTimeOut}





