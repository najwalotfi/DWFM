*** Settings ***
Documentation     DWFM-52: Manual Assignment
...               19 October 2020
...               Atikah Mohd Amin
Resource          Keywords.robot

*** Test Cases ***

DWFM52_TC1
    [Documentation]    To verify that user can view the earliest time slot for Daily Calendar Start Time
     ..                and the latest end time slot for Daily Calendar End Time for all available rosters.

    Login to DWFM
    Click at Manual Assignment under Work Force
    Click All button to view all available rosters
    Verify Earliest Start Time Slot
    Verify Latest Start Time Slot

    [Teardown]      Close Browser

DWFM52_TC2
    [Documentation]    - To verify that the In Progress task can be dragged over
     ...               and assign to a different or same roster if time slot is available.

    Login to DWFM
    Click at Manual Assignment under Work Force
    Click All button to view all available rosters
    Verify Earliest Start Time Slot
    Verify Latest Start Time Slot
    Select an In Progress task
    Drag over the task to the same roster in the Calendar
    Verify Task Is Assigned

    [Teardown]      Close Browser

DWFM52_TC3
    [Documentation]    - To verify that the time slot should reflect correctly if there is change of date or assignment group.

    Login to DWFM
    Click at Manual Assignment under Work Force
    Click All button to view all available rosters
    Verify Earliest Start Time Slot
    Verify Latest Start Time Slot
    Change Date of Manual Assignment
    Change Assignment Group of Manual Assignment
    Verify Time Slot Changed Successfully
    Verify Assignment Group Changed Successfully

    [Teardown]      Close Browser

DWFM52_TC4
    [Documentation]    - To verify that the break time in between start and end time should remain

    Login to DWFM
    Click at Manual Assignment under Work Force
    Click All in Manual Assignment
    Verify Earliest Start Time Slot
    Verify Latest Start Time Slot
    Verify Brake Time

    [Teardown]      Close Browser

DWFM52_TC5
    [Documentation]    - To verify that the time slot box size should be divided equally

    Login to DWFM
    Click at Manual Assignment under Work Force
    Click All in Manual Assignment
    Verify Earliest Start Time Slot
    Verify Latest Start Time Slot
    Verify the time slot boxes divided equally

    [Teardown]      Close Browser
