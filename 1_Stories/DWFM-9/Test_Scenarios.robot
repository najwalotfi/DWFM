*** Settings ***
Documentation     DWFM-9:To verify that the Calendar displayed is following the style guide
...               19 October 2020
...               Atikah Mohd Amin
Resource          Keywords.robot

*** Test Cases ***

DWFM9_TC1
    [Documentation]    To verify that the Calendar displayed is following the style guide

    Login to DWFM
    Click at Manual Assignment under Work Force
    Click All button to view all available rosters
    Verify Manual Assignment calendar displayed
    Mouse over the technician name
    Verify A tooltip should be displayed on the technician name
    Mouse over the task on left side
    Verify popup should be displayed showing details of the task
    [Teardown]      Close Browser

