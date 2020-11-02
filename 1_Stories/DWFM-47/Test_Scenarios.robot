*** Settings ***
Documentation     DWFM-47: Technician Roster Calendar
...               09 October 2020
...               Atikah Mohd Amin
Resource          Keywords.robot

*** Test Cases ***

DWFM47_TC1
    [Documentation]    To verify that the user is able to see 3 months in sequence at the pop up calendar.

    Login to DWFM
    Access Technician Roster From Workforce
    Click Calendar button in Technician Roster Page
    Verify pop up calendar should display 3 months in sequence from the current month

    [Teardown]      Close Browser

DWFM47_TC2
    [Documentation]    To verify that the 3 months view in the Calendar should start with the month selected by user.

    Login to DWFM
    Access Technician Roster From Workforce
    Choose Future Month In Calendar
    Verify Date Displayed in TimeTable
    Click Calendar button in Technician Roster Page
    Verify 3 months view should base on which month is the user currently viewing

    [Teardown]      Close Browser

DWFM47_TC3
    [Documentation]    To verify that user is allowed to move to next or previous month at the pop up Calendar.

    Login to DWFM
    Access Technician Roster From Workforce
    Click Calendar button in Technician Roster Page
    Verify pop up calendar should display 3 months in sequence from the current month
    At the pop up Calendar, click Next button to move to next month
    Verify The pop up Calendar should move to next month
    At the pop up Calendar, click Previous button to move to next month
    Verify The pop up Calendar should move to previous month
    [Teardown]      Close Browser



DWFM47_TC4
    [Documentation]    -To verify that the weekly roster view and the weekly title will be reflected according to user selection.
...                    - To verify that weekly roster view should start with Sunday

    Login to DWFM
    Access Technician Roster From Workforce
    Choose Future Month In Calendar
    After selection, observe the weekly roster and the weekly title
    Observe the day that starts the weekly roster
    Choose Second Future Month In Calendar
    After selection, observe the weekly roster and the weekly title2
    Observe the day that starts the weekly roster

    [Teardown]      Close Browser
