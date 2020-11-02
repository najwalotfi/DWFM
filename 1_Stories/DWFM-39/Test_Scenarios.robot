*** Settings ***
Documentation     DWFM-39: Truck Roll
...               02 October 2020
...               Atikah Mohd Amin
Resource          Keywords.robot

*** Test Cases ***

DWF39_TC1
    [Documentation]   To verify that user able to access Truck Roll module

    Login to DWFM
    Go to Control Panel
    Under Work Management, find Truck Roll
    [Teardown]      Close Browser
















