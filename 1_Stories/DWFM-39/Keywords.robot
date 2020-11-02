*** Settings ***
Library           String
Library           Collections
Resource          ../../2_Common/Generic_Resources/dwfm_resources.robot

*** Keywords ***

 Go to Control Panel
    Access Sub Menu From Workforce      Admin Maintenance       Control Panel

Under Work Management, find Truck Roll
    Capture Page Screenshot
    Wait Until Element Is Visible       ${WORK_MANAGEMENT_SUB_MENU_HEADER}       ${visibilityTimeOut}
    Scroll To Element   ${TRUCK_ROLL_COLUMN}
    Wait Until element Is Visible        ${TRUCK_ROLL_COLUMN}     ${visibilityTimeOut}
    Page Should Contain Element       ${TRUCK_ROLL_COLUMN}
    Page Should Contain Element         ${TRUCK_ROLL_UNDER_NETWORK_DETAIL}
    Capture Page Screenshot