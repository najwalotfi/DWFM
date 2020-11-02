*** Settings ***
Library           String
Library           Collections
Resource          ../../2_Common/Generic_Resources/dwfm_resources.robot

*** Keywords ***

Verify Manual Assignment calendar displayed
    Page Should Contain Element      ${MA_ROSTER}
    Page Should Contain Element    ${MA_TASK1}
    Capture Page Screenshot

Mouse over the technician name
    Mouse Over          //div[@class='vis-label']//span[contains(., '${TECHNICIAN_NAME_DATA}')]
    Sleep       1s

Verify A tooltip should be displayed on the technician name
    Capture Page Screenshot

Mouse over the task on left side
  Click Element      ${TASK_MANUAL_ASSIGNMENT}


Verify popup should be displayed showing details of the task
    Wait Until Element Is Visible       ${WORK_DETAILS_POPUP}       ${visibilityTimeOut}
    Page Should Contain Element         ${MORE_DETAILS_BTN}
    Capture Page Screenshot



