*** Settings ***
Library           String
Library           Collections
Resource          ../../2_Common/Generic_Resources/dwfm_resources.robot

*** Keywords ***
From Workforce Go to Device Section in Control Panel
    Access Sub Menu From Workforce      Admin Maintenance       Control Panel
    Choose option in Control Panel      Device
    Page Finished Loading



Click Create in Device Search
    Click Create        Device Search       Search Results

Fill in the form with wrong input
    Wait Until Element Is Visible       ${CREATE_DEVICE_POPUP_HEADER}       ${visibilitytimeout}
    Input Text In Textfield             Device UUID     ${DEVICE_UUID_INVALID_DATA}
    Choose Value From Drop Down List    Service Staff       ${SERVICE_STAFF_DATA}

Fill in the form with wrong input in Edit Mode
    Wait Until Element Is Visible       ${EDIT_DEVICE_POPUP_HEADER}       ${visibilitytimeout}
    Clear Textfield For Popup Window                   Device UUID
    Input Text In Textfield For Popup Window    Device UUID    ${DEVICE_UUID_INVALID_DATA}
    Select Value From Dropdown List For Popup Window        Service Staff       ${SERVICE_STAFF_DATA}

Verify Create Button Is Disable
    Element Should Be Disabled          ${CREATE_DEVICE_POPUP_CREATE_BTN}
    Page Should Contain Element         ${INVALID_DEVICE_UUID_FORMAT_NOTIFICATION}
    Capture Page Screenshot

Verify Edit Button Is Enable
     Element Should Be Enabled          ${EDIT_DEVICE_POPUP_UPDATE_BTN}
    Capture Page Screenshot

Go to other form and edit page and fill in with wrong input again
    Click Reset and Cancel Button in Create Device
    Filter Existing Search Result
    Click Element       ${SEARCH_RESULTS_ACTION_EDIT}
    Fill in the form with wrong input in Edit Mode
    Click Reset and Cancel Button in Edit Device

Click Reset and Cancel Button in Create Device
    Click Element           ${CREATE_DEVICE_POPUP_RESET_BTN}
    Wait Until Element Is Visible   ${DATA_RESET_CLOSE_BTN}     ${visibilityTimeOut}
    Click Element           ${DATA_RESET_CLOSE_BTN}
    Wait Until Element Is Not Visible       ${DATA_RESET_CLOSE_BTN}     ${visibilityTimeOut}
    Click Element           ${CREATE_DEVICE_POPUP_CANCEL_BTN}
    Wait Until Element Is Not Visible       ${CREATE_DEVICE_POPUP_HEADER}       ${visibilitytimeout}

Filter Existing Search Result
    ${filterSearchResult1} =         Get Text       ${FIRST_SEARCH_RESULT}
    Set Suite Variable      ${SEARCH_RESULT1}       ${filterSearchResult1}
    Input Text In Filter    Search Results          ${SEARCH_RESULT1}

Fill in the form with correct input
     Wait Until Element Is Visible       ${CREATE_DEVICE_POPUP_HEADER}       ${visibilitytimeout}
    Input Text In Textfield             Device UUID     ${DEVICE_UUID_VALID_DATA}
    Choose Value From Drop Down List    Service Staff       ${SERVICE_STAFF_DATA}

Verify Create Button Is Enable
     Element Should Be Enabled          ${CREATE_DEVICE_POPUP_CREATE_BTN}


Go to other form and edit page and fill in with correct input again
    Click Reset and Cancel Button in Create Device
    Filter Existing Search Result
    Click Element       ${SEARCH_RESULTS_ACTION_EDIT}
    Fill in the form with correct input in Edit Device
#    Click Reset and Cancel Button in Edit Device

Fill in the form with correct input in Edit Device
    Wait Until Element Is Visible       ${EDIT_DEVICE_POPUP_HEADER}       ${visibilitytimeout}
    Clear Textfield For Popup Window                   Device UUID
    Input Text In Textfield For Popup Window    Device UUID    ${DEVICE_UUID_VALID_DATA}
    Select Value From Dropdown List For Popup Window        Service Staff       ${SERVICE_STAFF_DATA}

Click Reset and Cancel Button in Edit Device
    Click Element           ${EDIT_DEVICE_POPUP_RESET_BTN}
    Wait Until Element Is Visible   ${DATA_RESET_CLOSE_BTN}     ${visibilityTimeOut}
    Click Element           ${DATA_RESET_CLOSE_BTN}
    Wait Until Element Is Not Visible       ${DATA_RESET_CLOSE_BTN}     ${visibilityTimeOut}
    Click Element           ${EDIT_DEVICE_POPUP_CANCEL_BTN}
    Wait Until Element Is Not Visible       ${EDIT_DEVICE_POPUP_HEADER}       ${visibilitytimeout}

