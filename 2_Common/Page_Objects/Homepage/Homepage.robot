*** Settings ***
Resource          ../../Generic_Resources/dwfm_resources.robot

*** Keywords ***
Reload If Page Failed To Load
      FOR    ${index}    IN RANGE    1    1000
        ${visibleMYEntt}   Run Keyword And Return Status    Wait Until Page Contains Element   ${NAVIGATED_TO_HOMEPAGE}     20s
        exit for loop if    ${visibleMYEntt} is ${True}
        Need to Reload Page
  END

Need to Reload Page
    Capture Page Screenshot
    Reload Page

Page Finished Loading
    Wait Until Element Is Visible           ${LOADING_SPINNER}
    Wait Until Page Contains Element        ${PAGE_LODING_DONE}     130s
    Wait Until Element Is Not Visible       ${PAGE_STILL_LOADING}   ${visibilityTimeOut}
    Wait Until Element Is Not Visible       ${LOADING_SPINNER}      ${visibilityTimeOut}


Page Loaded Successfully
    Page Should Contain Element      ${NAVIGATED_TO_HOMEPAGE}