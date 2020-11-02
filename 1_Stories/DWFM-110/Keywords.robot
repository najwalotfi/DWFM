*** Settings ***
Library           String
Library           Collections
Resource          ../../2_Common/Generic_Resources/dwfm_resources.robot

*** Keywords ***
From Workforce Go To Resolution Code Section In Control Panel
    Access Sub Menu From Workforce      Admin Maintenance       Control Panel
    Choose option in Control Panel      Resolution Code
    Page Finished Loading

Verify Resolution Code page will be displayed
    Page Should Contain Element    ${RESOLUTION_CODE_HEADER}
    Capture Page Screenshot

Click Create in Resolution Code
    click create        Resolution Code         Search Results

Verify Create pop-up screen will be displayed
    Wait Until Element Is Visible       ${CREATE_RC_POPUP_HEADER}       ${visibilityTimeOut}
    Capture Page Screenshot

Enter Name and Code in Resolution Code
    Input Text In Textfield For Popup Window            Name            ${RC_NAME_DATA}
    Input Text In Textfield For Popup Window           Code            ${RC_CODE_DATA}
    Capture Page Screenshot

Click Create Button in Create Resolution Code Popup
    Click Element       ${CREATE_RC_POPUP_CREATE_BTN}
    page finished loading
    Capture Page Screenshot


Verify the new record is displayed in the resolution code table
    Verify Search Result        [1]       ${RC_NAME_DATA}
    Verify Search Result        [2]       ${RC_CODE_DATA}
    Capture Page Screenshot

Filter Existing Resolution Code
    [Arguments]    ${resolutionCodeName}
    Input Text In Filter    Search Results          ${resolutionCodeName}
    Capture Page Screenshot

Click Edit at the resolution code record
    Click Element       ${EDIT_RC_CODE_BTN}
     page finished loading

Resolution Code Edit pop-up screen will be displayed
    Wait Until Element Is Visible       ${EDIT_RC_POPUP_HEADER}     ${visibilityTimeOut}

Existing information will be displayed in Resolution Code Edit Popup
    Textfield Should Contain        ${RC_NAME_TEXTFIELD}        ${RC_NAME_DATA}
    Textfield Should Contain        ${RC_CODE_TEXTFIELD}        ${RC_CODE_DATA}
    Capture Page Screenshot

Edit Name Textfield in Resolution Code Popup
    Clear Element Text         ${RC_NAME_TEXTFIELD}
    Input Text In Textfield For Popup Window    Name                 ${EDIT_RC_NAME_DATA}

Edit Code Textfield in Resolution Code Popup
    Clear Element Text         ${RC_CODE_TEXTFIELD}
    Input Text In Textfield For Popup Window    Code                 ${EDIT_RC_CODE_DATA}
    Capture Page Screenshot

Click Update in Resolution Code Popup
    Click Element       ${CREATE_RC_POPUP_UPDATE_BTN}
    page finished loading


Verify the updated record is displayed in the resolution code table
    Verify Search Result        [1]       ${EDIT_RC_NAME_DATA}
    Verify Search Result        [2]       ${EDIT_RC_CODE_DATA}
    Capture Page Screenshot

Create Another Resolution Code
    Enter Name and Code in Resolution Code 2
    Click Create Button in Create Resolution Code Popup

    Verify the new record is displayed in the resolution code table 2

Enter Name and Code in Resolution Code 2
   Input Text In Textfield             Name            ${RC_NAME_DATA2}
    Input Text In Textfield             Code            ${RC_CODE_DATA2}
    Capture Page Screenshot

Verify the new record is displayed in the resolution code table 2
     Verify Search Result        [1]       ${RC_NAME_DATA2}
    Verify Search Result        [2]       ${RC_CODE_DATA2}
    Capture Page Screenshot

Existing information will be displayed in Resolution Code Edit Popup 2
    Textfield Should Contain        ${RC_NAME_TEXTFIELD}        ${RC_NAME_DATA2}
    Textfield Should Contain        ${RC_CODE_TEXTFIELD}        ${RC_CODE_DATA2}
    Capture Page Screenshot

Edit Name Textfield in Resolution Code Popup 2
   Clear Element Text         ${RC_NAME_TEXTFIELD}
    Input Text In Textfield    Name                 ${EDIT_RC_NAME_DATA2}

Verify the updated name is displayed in the resolution code table
    Verify Search Result        [1]       ${EDIT_RC_NAME_DATA2}
    Capture Page Screenshot

Edit Code Textfield in Resolution Code Popup 2
    Clear Element Text         ${RC_CODE_TEXTFIELD}
    Input Text In Textfield    CODE                 ${EDIT_RC_CODE_DATA2}

Verify the updated code is displayed in the resolution code table
    Verify Search Result        [2]       ${EDIT_RC_CODE_DATA2}
    Capture Page Screenshot

Change Status from Active to Inactive
    Choose Value From Drop Down List        Status      Inactive
    Capture Page Screenshot

Verify Status is Inactive
    Verify Search Result        [3]       ${STATUS_INACTIVE_DATA}
    Capture Page Screenshot

Change Status from Inactive to Active
    Choose Value From Drop Down List        Status      Active
    Capture Page Screenshot

Verify Status is Active
    Verify Search Result        [3]       ${STATUS_ACTIVE_DATA}
    Capture Page Screenshot

Enter Duplicate Name and New Code in Resolution Code
    Input Text In Textfield             Name            ${EDIT_RC_NAME_DATA2}
    Input Text In Textfield             Code            ${RC_CODE_DATA3}
    set suite variable    {DUPLICATE_NAME}      ${EDIT_RC_NAME_DATA2}

Verify Error Message Name Is Duplicate
    Wait Until Page Contains Element        ${RC_DUPLICATE_NAME_ERROR_MSG}/span[contains(., ' Duplicate name resolution '{DUPLICATE_NAME}' found. Please try again. ')]      ${visibilityTimeOut}

Verify Create Resolution Code Button Is Enable
    Element Should Be Enabled         ${CREATE_RC_POPUP_CREATE_BTN}
    Capture Page Screenshot

Verify Create Button Is Disable in Create Resolution Code
    Element Should Be Disabled         ${CREATE_RC_POPUP_CREATE_BTN}
    Capture Page Screenshot

Click Cancel in Create Resolution Code
    Click Element                       ${CREATE_RC_POPUP_CANCEL_BTN}
    page finished loading

Verify No Duplicated Name Record Is Created in Resolution Code
    Wait Until Element Is Visible     ${RESOLUTION_CODE_HEADER}     ${visibilityTimeOut}
    Verify Record Is Not Created In Search Result       2          ${RC_CODE_DATA3}
    Capture Page Screenshot

Verify No Duplicated Edited Name Record Is Created in Resolution Code
    Wait Until Element Is Visible     ${RESOLUTION_CODE_HEADER}     ${visibilityTimeOut}
    Verify Record Is Not Created In Search Result       2           ${RC_CODE_DATA4}
    Capture Page Screenshot

Edit Name To Duplicate Name
    Clear Element Text         ${RC_NAME_TEXTFIELD}
    Clear Element Text          ${RC_CODE_TEXTFIELD}
    Input Text In Textfield    Name                 ${EXISTING_NAME_DATA}
    Input Text In Textfield    Code                 ${RC_CODE_DATA4}
    set suite variable          ${DUPLICATE_NAME}   ${EXISTING_NAME_DATA}

Enter Duplicate Code and New Name in Resolution Code
    Input Text In Textfield             Name            ${RC_NAME_DATA3}
    Input Text In Textfield             Code            ${EDIT_RC_CODE_DATA2}


Verify No Duplicated Code Record Is Created in Resolution Code
     Wait Until Element Is Visible     ${RESOLUTION_CODE_HEADER}     ${visibilityTimeOut}
    Verify Record Is Not Created In Search Result       2           ${RC_NAME_DATA3}
    Capture Page Screenshot

Edit Code To Duplicate Code
    Clear Element Text         ${RC_CODE_TEXTFIELD}
    Clear Element Text          ${RC_CODE_TEXTFIELD}
    Input Text In Textfield    Code                 ${EXISTING_CODE_DATA}
    Input Text In Textfield    Name                 ${RC_NAME_DATA4}

Verify No Duplicated Edited Code Record Is Created in Resolution Code
    Wait Until Element Is Visible     ${RESOLUTION_CODE_HEADER}     ${visibilityTimeOut}
    Verify Record Is Not Created In Search Result       1           ${RC_NAME_DATA4}
    Capture Page Screenshot

Create Resolution Code To Be Deleted
    Input Text In Textfield             Name            ${RC_NAME_DATA5}
    Input Text In Textfield             Code            ${RC_CODE_DATA5}
    Capture Page Screenshot
     Click Create Button in Create Resolution Code Popup
     Verify Search Result        [1]       ${RC_NAME_DATA5}
     Verify Search Result        [2]       ${RC_CODE_DATA5}
    Capture Page Screenshot

Click Delete in Resolution Code
    Click Element       ${RC_DELETE_BTN}
    Page Finished Loading
    Wait Until Element Is Visible       ${DELETE_RESOLUTION_CODE_POPUP_HEADER}       ${visibilityTimeOut}
    Page Should Contain Element         ${DELETE_RC_POPUP_MSG}
    Page Should Contain Element         ${DELETE_BTN_POPUP}
    Click Element                       ${DELETE_BTN_POPUP}
    Capture Page Screenshot
    Page Finished Loading

Verify Message displayed informs that the new record is created successfully
    Wait Until Element Is Visible    ${RC_SUCCESSFULLY_CREATED_MSG}     ${visibilityTimeOut}
    Capture Page Screenshot

Verify Message displayed informs that the new record is updated successfully
    Wait Until Element Is Visible    ${RC_SUCCESSFULLY_UPDATED_MSG}     ${visibilityTimeOut}
    Capture Page Screenshot

Verify Message displayed informs that the new record is deleted successfully
    Wait Until Element Is Visible    ${RC_SUCCESSFULLY_DELETED_MSG}     ${visibilityTimeOut}
    Capture Page Screenshot

Click OK to confirm the deletion
    Click Element                   ${DELETE_BTN_POPUP}
    Page Finished Loading
    Page Should Contain Element    ${RESOLUTION_CODE_HEADER}
    Capture Page Screenshot

Verify The record will be removed from the listing table
    Verify Record Is Deleted In Search Result       1       ${RC_NAME_DATA5}
    Verify Record Is Deleted In Search Result       2       ${RC_CODE_DATA5}

Verify the record cannot be deleted and is being used by other tables
     Wait Until Element Is Visible      ${RC_CANNOT_DELETE_USE_BYOTHER_TABLE_MSG}       ${visibilityTimeOut}
     Capture Page Screenshot

Click OK To Cannot Delete Message
    Click Element      ${RC_OK_REFERRED_RECORD}
    Page Finished Loading
    Page Should Contain Element    ${RESOLUTION_CODE_HEADER}
    Capture Page Screenshot

Verify the referred record will not be deleted from listing table
    Verify Search Result        [1]       ${REFERRED_RC_NAME_DATA}
    Capture Page Screenshot

Create Inactive Resolution Code To Be Deleted
    Input Text In Textfield             Name            ${RC_NAME_DATA6}
    Input Text In Textfield             Code            ${RC_CODE_DATA6}
    Capture Page Screenshot
    Click Create Button in Create Resolution Code Popup

    Verify Search Result        [1]       ${RC_NAME_DATA6}
    Verify Search Result        [2]       ${RC_CODE_DATA6}
    Capture Page Screenshot

Change Newly Created Record to Inactive
     Filter Existing Resolution Code     ${RC_NAME_DATA6}
    Click Edit at the resolution code record
    Resolution Code Edit pop-up screen will be displayed
    Change Status from Active to Inactive
    Click Update in Resolution Code Popup
    Verify Message displayed informs that the new record is updated successfully
    Filter Existing Resolution Code    ${RC_NAME_DATA6}
    Verify Status is Inactive

Verify The inactive record will be removed from the listing table
    Verify Record Is Deleted In Search Result       1       ${RC_NAME_DATA6}
    Verify Record Is Deleted In Search Result       2       ${RC_CODE_DATA6}

Change back status to active
    Filter Existing Resolution Code     ${REFERRED_RC_NAME_DATA}
    Click Edit at the resolution code record
    Resolution Code Edit pop-up screen will be displayed
    Change Status from Inactive to Active
    Verify Status is Active
    Close Browser