*** Settings ***
Documentation     DWFM-29: Button on Input Form Validation
...               01 October 2020
...               Atikah Mohd Amin
Resource          Keywords.robot

*** Test Cases ***

DWF29_TC1
    [Documentation]   To verify that when at least one form validation error is failed, the action button will be disabled.

    Login to DWFM
    From Workforce Go to Device Section in Control Panel
    Click Create in Device Search
    Fill in the form with wrong input
    Verify Create Button Is Disable
    Go to other form and edit page and fill in with wrong input again
    Verify Edit Button Is Enable
#    [Teardown]      Close Browser

DWF29_TC2
    [Documentation]   verify that when form is validated successfully, the action button will be enabled.

    Login to DWFM
    From Workforce Go To Device Section In Control Panel
    Click Create in Device Search
    Fill in the form with correct input
    Verify Create Button Is Enable
    Go to other form and edit page and fill in with correct input again
    Verify Edit Button Is Enable

#    [Teardown]      Close Browser

