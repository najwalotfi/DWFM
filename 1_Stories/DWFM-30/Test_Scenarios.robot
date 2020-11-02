*** Settings ***
Documentation     DWFM-30: Work Order Search- As an user I want work order search screen able to search by Appointment Id.
...               01 October 2020
...               Atikah Mohd Amin
Resource          Keywords.robot

*** Test Cases ***

DWFM30_TC1
    [Documentation]   User able to Login to DWFM System
    Login to DWFM
    [Teardown]      Close Browser

DWFM30_TC2
    [Documentation]   User Not able to Login to DWFM System

    Login to DWFM with Incorrect Username
    Close Browser
    Login to DWFM with Incorrect Password
#    [Teardown]      Close Browser

DWFM30_TC3
    [Documentation]   To verify user at work order landing “Quick Search Tab”

     Login to DWFM
     Click at Work Order under Work Force
     Observe the Quick Search Tab is available
     [Teardown]      Close Browser

DWFM30_TC4
    [Documentation]   "Appointment ID" value at “Quick Search Tab” is verified

     Login to DWFM
     Click at Work Order under Work Force
     Verify Search By Drop Down List Showing Appointment ID
     [Teardown]      Close Browser

DWFM30_TC5
    [Documentation]   Work order value by "Appointment ID" return the exact match at “Quick Search Tab” is verified

     Login to DWFM
     Click at Work Order under Work Force
     Verify Search By Drop Down List Showing Appointment ID
     Enter Appointmet ID Value
     Click Search
     Verify Search Result Return Exact Match
     [Teardown]      Close Browser

DWFM30_TC6
    [Documentation]   "Advance Search" tab is verified

     Login to DWFM
     Click at Work Order under Work Force
     Click on "Advance Search" tab
     [Teardown]      Close Browser

DWFM30_TC7
    [Documentation]   Screen should show “Appointment ID” Before “Work Order ID” at "Advance Search" tab is verified

    Login to DWFM
     Click at Work Order under Work Force
     Click on "Advance Search" tab
     Verify Appointment ID Before Work Order ID
     [Teardown]      Close Browser

DWFM30_TC8
    [Documentation]   Subsequent input field should be shifted accordingly with maximum 4 input field per row at "Advance Search" tab is verified

    Login to DWFM
     Click at Work Order under Work Force
     Click on "Advance Search" tab
     Verify maximum 4 input field per row at "Advance Search" tab
     [Teardown]      Close Browser

DWFM30_TC9
    [Documentation]    “Appointment ID”  input type to allow is numeric at "Advance Search" tab is verified

     Login to DWFM
     Click at Work Order under Work Force
     Click on "Advance Search" tab
     Input Appointment ID in Numeric
     Verify the Appointment ID text in numeric is entered
     [Teardown]      Close Browser

DWFM30_TC10
     [Documentation]   Work Order Listing is verified

     Login to DWFM
     Click at Work Order under Work Force
     Observed the Work Order Listing page populated
     [Teardown]      Close Browser

DWFM30_TC11
     [Documentation]   Search result should show “Appointment ID” column and data before “Appointment Date” at Work Order Listing  is verified

     Login to DWFM
     Click at Work Order under Work Force
     Observed the Work Order Listing page populated
     Click Search
     Verify Search result should show Appointment ID column and data before Appointment Date
     [Teardown]      Close Browser

DWFM30_TC12
   [Documentation]   Work Order Listing Export is verified

    Login to DWFM
     Click at Work Order under Work Force
     Observed the Work Order Listing page populated
     Click Search
     Click Export in Work Order
     Verify Excel Sheet Downloaded
     [Teardown]      Close Browser

DWFM30_TC14
   [Documentation]   Work Order Detail is verified

      Login to DWFM
     Click at Work Order under Work Force
     Observed the Work Order Listing page populated
     Access Work Order Detail
     [Teardown]      Close Browser

DWFM30_TC15
   [Documentation]   Work Order Detail column should show “Appointment ID” column before “Appointment Date” in view format  is verified

      Login to DWFM
     Click at Work Order under Work Force
     Observed the Work Order Listing page populated
     Access Work Order Detail
     Verify Appointment ID Before Appointment Date in Work Order Detail
     [Teardown]      Close Browser







     

