*** Settings ***
Library           String
Library           Collections
Resource          ../../2_Common/Generic_Resources/dwfm_resources.robot

*** Keywords ***
From Administration Go To Create Section
    Access Sub Menu From Administration     Staff       Create

Verify navigated to create user page
    Wait Until Element Is Visible       ${CREATE_USER_HEADER}       ${visibilityTimeOut}

Randomize Account Name
    ${accNAmeNo} =    Generate Random String    3    [NUMBERS]
    log     ${accNAmeNo}
    Set Suite Variable      ${APPEND_NO_DATA}       ${accNAmeNo}
    ${concateAccName} =    Catenate    SEPARATOR=    AutoGen User-    ${APPEND_NO_DATA}
    Set Suite Variable    ${ACCOUNT_NAME_DATA}    ${concateAccName}


Enter all staff employee details
    Input Text In Textfield         Account Name        ${ACCOUNT_NAME_DATA}
    Choose Option In Radio Button   Title               ${USER_TITLE_DATA}
    Input Text In Textfield         Password            ${PWUD_DATA}
    Input Text In Textfield         Confirm Password    ${PWUD_DATA}
    Input Text In Textfield         First Name          ${FIRST_NAME_DATA}${APPEND_NO_DATA}
    Input Text In Textfield         Last Name           ${LAST_NAME_DATA}${APPEND_NO_DATA}
    Choose Option In Radio Button   Gender              ${USER_GENDER_DATA}
    Input Text In Textfield         Email address:      ${ACCOUNT_NAME_DATA}@gmail.com
    Select Country Code In Phone No In Combobox     Contact Number      Malaysia
    Input Text                      ${PHONE_NO_COMBOBOX}            ${PHONE_NO_MY_DATA}
    Scroll To Element               ${OWNER_DDL}
    Capture Page Screenshot

Click Create in Create User
    Click Button    Create

Verify Staff Employee Created Successfully
    Wait Until Element Is Visible       ${SUCCESSFULLY_CREATED_USER}        ${visibilityTimeOut}
    Page Should Contain Element         ${SUCCESSFULLY_CREATED_USER_CLOSE_BTN}
    Capture Page Screenshot
    Click Element                       ${SUCCESSFULLY_CREATED_USER_CLOSE_BTN}

Access Customer Section
    Click Element       ${KC_REALM_CUSTOMER}
    Wait Until Element Is Visible    ${KC_CUSTOMER_DROP_DOWN}      ${visibilityTimeOut}

Navigate to Users
    Scroll To Element    ${KC_USERS}
    Click Element        ${KC_USERS}
    Wait Until Element Is Visible       ${USERS_HEADER}     ${visibilityTimeOut}
    Capture Page Screenshot

Search User Name In Keycloak
    Input Text          ${USERS_SEARCH_TEXTFIELD}           ${ACCOUNT_NAME_DATA}
    Click Element       ${USERS_SEARCH_BTN}

Search Contractor User Name In Keycloak
    Input Text          ${USERS_SEARCH_TEXTFIELD}           ${ACCOUNT_NAME_CONTRACTOR_DATA}
    Click Element       ${USERS_SEARCH_BTN}
]

Verify User Is Listed in Search Result
    Wait Until Element Is Visible    ${SEARCH_RESULT_TABLE}     ${visibilityTimeOut}


Verify that the information for the staff employee is correct
    Page Should Contain Element     //tr/td[contains(., '${ACCOUNT_NAME_DATA}@gmail.com')]
    Page Should Contain Element     //tr/td[contains(., '${FIRST_NAME_DATA}${APPEND_NO_DATA}')]
    Page Should Contain Element     //tr/td[contains(., '${LAST_NAME_DATA}${APPEND_NO_DATA}')]
    Page Should Contain Element     //tr/td[contains(., '${ACCOUNT_NAME_DATA}')]
    Capture Page Screenshot

From Workforce Go To Company Profile In Control Panel
    Access Sub Menu From Workforce      Admin Maintenance       Control Panel
    Choose Option In Control Panel      Company

Verify Data Populated in Company Profile Search Results
    Page Should Contain Element    ${COMPANY_PROFILE_TABLE_CONTENT}

Select Value From Owner Drop Down List
    Select From List By Value       ${OWNER_DDL}         0: 5

Randomize Account Name for Contractor
    ${accNAmeNo} =    Generate Random String    3    [NUMBERS]
    log     ${accNAmeNo}
    Set Suite Variable      ${APPEND_NO_DATA}       ${accNAmeNo}
    ${concateAccName} =    Catenate    SEPARATOR=    AutoGen Contractor-    ${APPEND_NO_DATA}
    Set Suite Variable    ${ACCOUNT_NAME_CONTRACTOR_DATA}    ${concateAccName}


Enter all contractor employee details
    Input Text In Textfield         Account Name        ${ACCOUNT_NAME_CONTRACTOR_DATA}
    Choose Option In Radio Button   Title               ${USER_TITLE_DATA}
    Input Text In Textfield         Password            ${PWUD_DATA}
    Input Text In Textfield         Confirm Password    ${PWUD_DATA}
    Input Text In Textfield         First Name          ${FIRST_NAME_CONTRACTOR_DATA}${APPEND_NO_DATA}
    Input Text In Textfield         Last Name           ${LAST_NAME_CONTRACTOR_DATA}${APPEND_NO_DATA}
    Choose Option In Radio Button   Gender              ${USER_GENDER_DATA}
    Input Text In Textfield         Email address:      ${ACCOUNT_NAME_CONTRACTOR_DATA}@gmail.com
    Select Country Code In Phone No In Combobox     Contact Number      Malaysia
    Input Text                      ${PHONE_NO_COMBOBOX}            ${PHONE_NO_MY_DATA}
    Capture Page Screenshot

Verify that the information for the contractor is correct
    Page Should Contain Element     //tr/td[contains(., '${ACCOUNT_NAME_CONTRACTOR_DATA}@gmail.com')]
    Page Should Contain Element     //tr/td[contains(., '${FIRST_NAME_CONTRACTOR_DATA}${APPEND_NO_DATA}')]
    Page Should Contain Element     //tr/td[contains(., '${LAST_NAME_CONTRACTOR_DATA}${APPEND_NO_DATA}')]
    Page Should Contain Element     //tr/td[contains(., '${ACCOUNT_NAME_CONTRACTOR_DATA}')]
    Capture Page Screenshot

Search all contractor companies by entering the Search By and the corresponding Value
    Choose Value From Drop Down List        Search By       Name
    Click Element       ${SEARCH_BTN}

All contractor companies will be displayed at the search listing table
    Verify Data Populated in Company Profile Search Results
    Get Name From Search Result Table

Get Name From Search Result Table
    Scroll To Element     ${COMPANY_NAME1}
    ${companyName1} =   Get Text        ${COMPANY_NAME1}
    set suite variable    ${COMPANY_NAME_TEXT1}      ${companyName1}
    ${companyName2} =   Get Text        ${COMPANY_NAME2}
    set suite variable    ${COMPANY_NAME_TEXT2}      ${companyName2}
    ${companyName3} =   Get Text        ${COMPANY_NAME3}
    set suite variable    ${COMPANY_NAME_TEXT3}      ${companyName3}
    Capture Page Screenshot

Click on the Owner drop down list
    Scroll To Element    ${OWNER_DDL}
    Click Element       ${OWNER_DDL}

Verify all the contractor companies listed in the drop down
    Page Should Contain Element    //*[@id="formly_34_select_partySelect_0"]/option[contains(., '${COMPANY_NAME1}')]
    Page Should Contain Element    //*[@id="formly_34_select_partySelect_0"]/option[contains(., '${COMPANY_NAME2}')]
    Page Should Contain Element    //*[@id="formly_34_select_partySelect_0"]/option[contains(., '${COMPANY_NAME3}')]
    Capture Page Screenshot

Click Edit on one of the contractor
    Input Text In Filter        ${EDIT_COMPANY_NAME_DATA}
    Scroll To Element           ${COMPANY_EDIT_BTN}
    Click Element               ${COMPANY_EDIT_BTN}
    Page Finished Loading
    ##workaround
    Click Element           //button[contains(., 'Close')]
    ###

Update Company Profile screen will be displayed
    Wait Until Page Contains Element    ${UPDATE_COMPANY_PROFILE_HEADER}        ${visibilityTimeOut}
    Scroll To Element                   ${UPDATE_COMPANY_PROFILE_HEADER}
    Capture Page Screenshot

Edit the Name
    Clear Text Field        Name
    Input Text In Textfield    Name     ${EDITED_NEW_COMPANY_NAME_DATA}
    Capture Page Screenshot

click Update button
    Click Button        Update
    Page Finished Loading
    Capture Page Screenshot

Verify The contractor Name will be updated successfully
    Scroll To Element       ${SEARCH_RESULTS_HEADER}
    Input Text In Filter        ${EDITED_NEW_COMPANY_NAME_DATA}
    Verify Search Result        [1]     ${EDITED_NEW_COMPANY_NAME_DATA}

Verify The Owner drop down list should display the updated contractor name
     Page Should Contain Element    //*[@id="formly_34_select_partySelect_0"]/option[contains(., '${EDITED_NEW_COMPANY_NAME_DATA}')]
     Capture Page Screenshot

Edit the Is Contractor from Y to N
    Choose Value From Drop Down List        Is Contractor       N
    Capture Page Screenshot

Verify The Owner drop down list should not display the contractor
    Page Should Not Contain Element    //*[@id="formly_34_select_partySelect_0"]/option[contains(., '${EDITED_NEW_COMPANY_NAME_DATA}')]
    Capture Page Screenshot

Click Create In Company Profile
    Click Create        Search Company      Search Results
    Page Finished Loading

Create New Contractor Company Profile
    Input Text In Textfield    Name         ${CREATE_NEW_COMPANY_NAME_DATA}
    Input Text In Textfield    Code         KF001
    Input Text In Textfield    Description  Contractor008
    Input Text In Textfield    Owner        Tony Fergusonisov
    Input Text In Textfield    Floor/Unit   12
    Input Text In Textfield    Building Name    Tower Manuri
    Input Text In Textfield    Building Number  22
    Input Text In Textfield    Building Code    BC003
    Input Text In Textfield    Company Size     100
    Input Text In Textfield    Postal Code      100432
    Choose Value From Drop Down List    Country     Singapore
    Input Text In Textfield    Business Nature  Logistics
    Input Text In Textfield    Contact Person   Jeremy Cordon
    Input Text In Textfield    Contact Number   01234344225
    Input Text In Textfield    Contact Email    jcordon@gmail.com
    Input Text In Textfield    Website          www.kfevermvr.com
    Choose Value From Drop Down List    Is Contractor       Y
    Capture Page Screenshot

Click Create Button In Create Company Profile
    Click Button        Create
    Page Finished Loading
    Verify New Contractor Created Successfully

Verify New Contractor Created Successfully
    Scroll To Element       ${SEARCH_RESULTS_HEADER}
    Input Text In Filter        ${CREATE_NEW_COMPANY_NAME_DATA}
    Verify Search Result        [1]     ${CREATE_NEW_COMPANY_NAME_DATA}
    Capture Page Screenshot

Click Delete on one of the contractor
    Input Text In Filter        ${CREATE_NEW_COMPANY_NAME_DATA}
    Scroll To Element           ${COMPANY_DELETE_BTN}
    Click Element               ${COMPANY_DELETE_BTN}
    Page Finished Loading
    Verify Successfully Deleted Record

Verify Contractor Deleted Successfully
    Scroll To Element       ${SEARCH_RESULTS_HEADER}
    Input Text In Filter        ${CREATE_NEW_COMPANY_NAME_DATA}
    Verify Record Is Deleted in Search Result        [1]     ${CREATE_NEW_COMPANY_NAME_DATA}

Verify The Owner drop down list should not display the deleted contractor
    Page Should Not Contain Element    //*[@id="formly_34_select_partySelect_0"]/option[contains(., '${CREATE_NEW_COMPANY_NAME_DATA}')]
    Capture Page Screenshot

Change back edited contractor name
    From Workforce Go To Company Profile In Control Panel
    Click Edit on one of the contractor
    Update Company Profile screen will be displayed
    Edit the Name Back To Original Name
    click Update button
    Verify The contractor Name will be updated successfully
    Close Browser

Edit the Name Back To Original Name
     Clear Text Field        Name
    Input Text In Textfield    Name     ${EDIT_COMPANY_NAME_DATA}
    Capture Page Screenshot


Verify that only one staff record is created
    Page Should Contain Element     //tr/td[contains(., '${ACCOUNT_NAME_CONTRACTOR_DATA}')]     limit=1

Verify that only one contractor record is created
    Page Should Contain Element     //tr/td[contains(., '${ACCOUNT_NAME_CONTRACTOR_DATA}')]    limit=1










