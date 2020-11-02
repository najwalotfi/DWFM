*** Settings ***
Library           String
Library           Collections
Resource          ../../2_Common/Generic_Resources/dwfm_resources.robot

*** Keywords ***
Click at Manual Assignment under Work Force
    Access Sub Menu From Workforce      Work Management     Manual Assignment
    Page Should Contain Element     ${MANUAL_ASSIGNMENT_HEADER}

Click All button to view all available rosters
    Choose Assignment Group
    Choose Date
    Click All in Manual Assignment

Choose Assignment Group
    choose value from drop down list       Assignment    ${ASSMNT_GROUP_DATA}

Choose Date
    Click Element       ${MA_CALENDAR_BTN}
    Wait Until Element Is Visible       ${MA_CALENDAR_BTN}      ${visibilityTimeOut}
    select from list by value      ${CALENDAR_MONTH_DLL}        ${MA_MONTH_DATA}
    Click Element       ${MA_DAY_DATA}
    Page Finished Loading

Click All in Manual Assignment
    Click Element       ${MA_ALL_TASK}
    Wait Until Element Is Visible    ${MA_TASK1}    ${visibilityTimeOut}
    Capture Page Screenshot

Verify Earliest Start Time Slot
    ${earliestStartTime} =      Get Text        ${EARLIEST_TASK}
    log     ${earliestStartTime}
    Capture Page Screenshot

Verify Latest Start Time Slot
    ${latestEndTime} =      Get Text        ${LATEST_TASK}
    log     ${latestEndTime}
    Capture Page Screenshot

Select an In Progress task
    Page Should Contain Element     ${PENDING_TASK1}

Drag over the task to the same roster in the Calendar
    Drag And Drop       ${PENDING_TASK1}        ${CALENDAR_DROP_TARGET1}
    Wait Until Element Is Visible       ${ASSMNT_VALIDATION_MSG}          ${visibilityTimeOut}
    Capture Page Screenshot
    Click Element       ${MA_OVERRIDE_BTN}

Verify Task Is Assigned
    Wait Until Page Contains Element        ${TASK_ASSIGNED_IN_ROSTER}        ${visibilityTimeOut}
    Page Should Contain Element         ${TASK_NO_IN_ROSTER}
    PAGE SHOULD CONTAIN ELEMENT         ${TASK_ASSIGNED_IN_TASK_LIST}
    Capture Page Screenshot

Change Date of Manual Assignment
    Click Element       ${MA_CALENDAR_BTN}
    Wait Until Element Is Visible       ${MA_CALENDAR_BTN}      ${visibilityTimeOut}
    select from list by value      ${CALENDAR_MONTH_DLL}        ${MA_CHANGE_MONTH_DATA}
    Click Element       ${MA_CHANGE_DAY_DATA}

Change Assignment Group of Manual Assignment
    choose value from drop down list       Assignment    ${ASSMNT_GROUP_DATA2}

Verify Time Slot Changed Successfully
    Page Should Contain Element     ${CHANGED_DATE}
    Capture Element Screenshot      ${CHANGED_DATE}         filename=changed_date-{index}.png

Verify Assignment Group Changed Successfully
    Page Should Contain Element     ${CHANGED_ASSIGNMENT_GROUP}
    Capture Element Screenshot      ${CHANGED_ASSIGNMENT_GROUP}        filename=changed_assmnt-group-{index}.png

Verify Brake Time
    Capture Element Screenshot    ${MA_ROSTER}      filename=manual_assignment_breaktime-{index}.png

Verify the time slot boxes divided equally
    Page Should Contain Element     ${TIMESLOT1}
    Page Should Contain Element     ${TIMESLOT2}
    Capture Element Screenshot    ${MA_ROSTER}      filename=manual_assignment_timeslot_equal-{index}.png





