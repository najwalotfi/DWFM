*** Settings ***
Library           String
Library           Collections
Resource          ../../2_Common/Generic_Resources/dwfm_resources.robot

*** Keywords ***
From Workforce Go To Truck Roll Section In Control Panel
    Access Sub Menu From Workforce      Admin Maintenance       Control Panel
    Choose option in Control Panel      Truck Roll
    Page Finished Loading


Verify Directed to Truck Roll Listing Page Successfully
    Scroll To Element       ${TRUCK_ROLL_LISTING}
    Capture Page Screenshot

Observe Quick Search and Advance Search tabs in Truck Roll
    Page Should Contain Element     ${QUICK_SEARCH_TAB_ENABLED}
    Page Should Contain Element     ${ADVANCED_SEARCH_TAB}
    Capture Page Screenshot

Observe Search Result section in Truck Roll
    Verify Directed to Truck Roll Listing Page Successfully

Go To Quick Search Tab Section in Truck Roll
    Scroll To Element    ${QUICK_SEARCH_TAB_ENABLED}

Go To Advanced Search Tab Section in Truck Roll
    Select Tab      Advanced Search

Click on Search By Drop Down List
    Click Element       ${SEARCH_BY_DDL}


Verify The listing or selection should include No of Days and No of Visits
    Wait Until Element Is Visible       //div[contains(@class, 'select-dropdown-list show')]        30s
    Capture Page Screenshot
    Page Should Contain Element     ${NO_OF_DAYS_SELECTION}
    Page Should Contain Element     ${NO_OF_VISITS_SELECTION}
    Capture Page Screenshot

Click on Search By and select No of Days
    Choose Value From Drop Down List        Search By       No. of Days

Click on Search By and select No of Visits
    Choose Value From Drop Down List        Search By       No. of Visits

Attempt to enter alphabets at search Value
    Input Text In Textfield         Value       ${ALPHABET_TEST_DATA}
    Verify User should not be able to input alphabets for search Value

Verify User should not be able to input alphabets for search Value
    Page Should Not Contain     ${ALPHABET_TEST_DATA}
    Capture Page Screenshot

Attempt to enter special characater at search Value
    Input Text In Textfield         Value       ${ALPHABET_TEST_DATA}
    Verify User should not be able to input special character for search Value

Verify User should not be able to input special character for search Value
    Page Should Not Contain     ${SPECIAL_CHAR_DATA}
    Capture Page Screenshot

Input an integer from no of days at search Value
    Get Existing No OF Days Search Result
    Input Text In Textfield         Value        ${TRUCK_ROLL_GET_TEXT_NO_DAYS_DATA}
    Capture Page Screenshot

Input an integer from no of visits at search Value
    Get Existing No OF Visits Search Result
    Input Text In Textfield         Value       ${TRUCK_ROLL_GET_TEXT_NO_VISITS_DATA}
    Capture Page Screenshot

Get Existing No OF Days Search Result
    ${getNoOfDays1} =         Get Text       ${NO_OF_DAYS_SEARCH_RESULT_TEXT1}
    Set Suite Variable      ${TRUCK_ROLL_GET_TEXT_NO_DAYS_DATA}       ${getNoOfDays1}

Get Existing No OF Visits Search Result
    ${getNoOfVisits1} =         Get Text       ${NO_OF_VISITS_SEARCH_RESULT_TEXT1}
    Set Suite Variable      ${TRUCK_ROLL_GET_TEXT_NO_VISITS_DATA}       ${getNoOfVisits1}

Verify No OF Days Search Result in Truck Roll When Search Using Integer
    Verify Search Result        1       ${TRUCK_ROLL_GET_TEXT_NO_DAYS_DATA}

Verify No OF Visits Search Result in Truck Roll When Search Using Integer
    Verify Search Result        2       ${TRUCK_ROLL_GET_TEXT_NO_VISITS_DATA}

Verify No of Days and Visits Textfield Are Displayed
    Page Should Contain Element     ${ADVANCED_SEARCH_NO_OF_DAYS_TEXTFIELD}
    Page Should Contain Element     ${ADVANCED_SEARCH_NO_OF_VISITS_TEXTFIELD}


Attempt to enter alphabets at search No Of Days in Truck Roll Advanced Search
    Input Text In Textfield         No. of Days:       ${ALPHABET_TEST_DATA}

Attempt to enter special characater at search No of Days in Truck Roll Advanced Search
    Input Text In Textfield         No. of Days:        ${SPECIAL_CHAR_DATA}


Input an integer from no of days at search No of Days in Truck Roll Advanced Search
    Get Existing No OF Days Search Result
    Input Text In Textfield         No. of Days:        ${SPECIAL_CHAR_DATA}

Attempt to enter alphabets at search No Of Visits in Truck Roll Advanced Search
    Input Text In Textfield         No. of Visits:       ${ALPHABET_TEST_DATA}

Attempt to enter special characater at search No of Visits in Truck Roll Advanced Search
    Input Text In Textfield         No. of Days:        ${SPECIAL_CHAR_DATA}

Input an integer from no of visits at search No of Visits in Truck Roll Advanced Search
    Get Existing No OF Visits Search Result
    Input Text In Textfield         No. of Visits:        ${SPECIAL_CHAR_DATA}

Click Create in Truck Roll
    Click Create        Search Results      Search Results
    Page Finished Loading

Observe the create truck roll pop up window
    Page Should Contain Element     ${CREATE_TRUCK_ROLL_POPUP_HEADER}
    Page Should Contain Element     ${CREATE_TRUCK_ROLL_POPUP_CREATE_BTN}
    Page Should Contain Element     ${CREATE_TRUCK_ROLL_POPUP_CANCEL_BTN}
    Page Should Contain Element     ${CREATE_TRUCK_ROLL_POPUP_RESET_BTN}
    Verify Textfield Is Mandatory       No.of Days
    Verify Textfield Is Mandatory       No.of Visits
    Capture Page Screenshot

Click Edit truck roll in Truck Roll
    Click Element       ${SEARCH_RESULTS_ACTION_EDIT}
    Page Finished Loading

Click Delete truck roll in Truck Roll
    Get Existing No OF Days Search Result
    Get Existing No OF Visits Search Result
    Click Element       ${SEARCH_RESULTS_ACTION_DELETE}
    Page Finished Loading

Observe the edit truck roll pop up window
    Page Should Contain Element     ${EDIT_TRUCK_ROLL_POPUP_HEADER}
    Page Should Contain Element     ${EDIT_TRUCK_ROLL_POPUP_UPDATE_BTN}
    Page Should Contain Element     ${EDIT_TRUCK_ROLL_POPUP_CANCEL_BTN}
    Page Should Contain Element     ${EDIT_TRUCK_ROLL_POPUP_RESET_BTN}

At the Create Truck Roll pop-up window, erase data
    Clear Text Field            No.of Days
    Wait Until Element Is Visible   ${INVALID_FBACK_THIS_FIELD_IS_REQUIRED}     ${visibilityTimeOut}
    Element Should Be Disabled      ${CREATE_TRUCK_ROLL_POPUP_CREATE_BTN}
    Clear Text Field            No.of Visits
    Wait Until Element Is Visible   ${INVALID_FBACK_THIS_FIELD_IS_REQUIRED}     ${visibilityTimeOut}
    Element Should Be Disabled     ${CREATE_TRUCK_ROLL_POPUP_CREATE_BTN}
    Capture Page Screenshot


Click Cancel in Truck Roll Create
    Click Element       ${CREATE_TRUCK_ROLL_POPUP_CANCEL_BTN}
    Page Finished Loading

Click Cancel in Truck Roll Edit
    Click Element       ${EDIT_TRUCK_ROLL_POPUP_CANCEL_BTN}
    Page Finished Loading

Previous screen will be displayed
    Page Should Contain Element     ${TRUCK_ROLL_LISTING}
    Capture Page Screenshot

At the Edit Truck Roll pop-up window, erase data
    Click Edit truck roll in Truck Roll
    Clear Text Field            No.of Days
    Wait Until Element Is Visible   ${INVALID_FBACK_THIS_FIELD_IS_REQUIRED}     ${visibilityTimeOut}
    Element Should Be Disabled      ${EDIT_DEVICE_POPUP_UPDATE_BTN}
    Clear Text Field            No.of Visits
    Wait Until Element Is Visible   ${INVALID_FBACK_THIS_FIELD_IS_REQUIRED}     ${visibilityTimeOut}
    Element Should Be Disabled     ${EDIT_DEVICE_POPUP_UPDATE_BTN}
    Capture Page Screenshot

Enter values for No of Days
    Input Text In Textfield     No.of Days      ${TRUCK_ROLL_INT_TEST_NO_OF_DAYS_DATA}

click Reset button in Truck Roll Create
    Click Element           ${CREATE_TRUCK_ROLL_POPUP_RESET_BTN}

Value Reset to Zero in No Of Days
    Wait Until Element Is Visible       //label[contains(@class, 'show-required')]/span[contains(., 'No.of Days')]/ancestor::div[contains(@class, 'default-label')]/following-sibling::div[@class='input-group']//input[contains(@ng-reflect-model, '0')]       ${visibilityTimeOut}
    Capture Page Screenshot

Enter values for No of Visits
    Input Text In Textfield     No.of Visits      ${TRUCK_ROLL_INT_TEST_NO_OF_VISITS_DATA}

Value Reset to Zero in No Of Visits
    Wait Until Element Is Visible       //label[contains(@class, 'show-required')]/span[contains(., 'No.of Visits')]/ancestor::div[contains(@class, 'default-label')]/following-sibling::div[@class='input-group']//input[contains(@ng-reflect-model, '0')]       ${visibilityTimeOut}
    Capture Page Screenshot

Click Reset button in Truck Roll Edit
    Click Element           ${EDIT_TRUCK_ROLL_POPUP_RESET_BTN}

Values should remain as it is
    Sleep   2s
    Textfield Should Contain        //label[contains(@class, 'show-required')]/span[contains(., 'No.of Days')]/ancestor::div[contains(@class, 'default-label')]/following-sibling::div[@class='input-group']//input       ${TRUCK_ROLL_INT_TEST_NO_OF_DAYS_DATA2}
    Textfield Should Contain        //label[contains(@class, 'show-required')]/span[contains(., 'No.of Visits')]/ancestor::div[contains(@class, 'default-label')]/following-sibling::div[@class='input-group']//input       ${TRUCK_ROLL_INT_TEST_NO_OF_VISITS_DATA2}
    Capture Page Screenshot

Create Truck Roll
    Click Create in Truck Roll
    Input Text In Textfield     No.of Days      ${TRUCK_ROLL_INT_TEST_NO_OF_DAYS_DATA2}
    Input Text In Textfield     No.of Visits      ${TRUCK_ROLL_INT_TEST_NO_OF_VISITS_DATA2}
    Click Element           ${CREATE_TRUCK_ROLL_POPUP_CREATE_BTN}
    Page Finished Loading
    Wait Until Element Is Visible       ${DATA_SUCCESSFULLY_CREATED_MSG}    ${visibilityTimeOut}
    Click Element           ${DATA_RESET_CLOSE_BTN}
    Previous screen will be displayed

Enter values for No of Days in Truck Roll Edit
    Input Text In Textfield     No.of Days      ${TRUCK_ROLL_INT_TEST_NO_OF_DAYS_DATA3}

Enter values for No of Visits in Truck Roll Edit
    Input Text In Textfield     No.of Visits      ${TRUCK_ROLL_INT_TEST_NO_OF_VISITS_DATA3}

Values Entered Successfully
    Textfield Should Contain        //label[contains(@class, 'show-required')]/span[contains(., 'No.of Days')]/ancestor::div[contains(@class, 'default-label')]/following-sibling::div[@class='input-group']//input       ${TRUCK_ROLL_INT_TEST_NO_OF_DAYS_DATA3}
    Textfield Should Contain        //label[contains(@class, 'show-required')]/span[contains(., 'No.of Visits')]/ancestor::div[contains(@class, 'default-label')]/following-sibling::div[@class='input-group']//input       ${TRUCK_ROLL_INT_TEST_NO_OF_VISITS_DATA3}
    Capture Page Screenshot

Click Create Button In Create Truck Roll Pop Up
    Click Element           ${CREATE_TRUCK_ROLL_POPUP_CREATE_BTN}
    Page Finished Loading

Verify Successfully Created Record
    Wait Until Element Is Visible       ${DATA_SUCCESSFULLY_CREATED_MSG}    ${visibilityTimeOut}
    Capture Page Screenshot

Click Close button at the notification message
    Click Element           ${DATA_RESET_CLOSE_BTN}
    Previous screen will be displayed

Verify Truck Roll listing page will be displayed
    Verify Search Result        [1]     ${TRUCK_ROLL_INT_TEST_NO_OF_DAYS_DATA}
    Verify Search Result        [2]     ${TRUCK_ROLL_INT_TEST_NO_OF_VISITS_DATA}
    Capture Page Screenshot

Verify Truck Roll listing page will be displayed as Zero
    Verify Search Result        [1]     ${zero_value}
    Verify Search Result        [2]     ${zero_value}
    Capture Page Screenshot

At the Edit Truck Roll pop-up window, edit values for No of Days and or No of Visits
    Enter Values For No Of Days In Truck Roll Edit
    Enter Values For No Of Visits In Truck Roll Edit

Click Update button in Truck Roll Pop Up
    Click Element       ${EDIT_TRUCK_ROLL_POPUP_UPDATE_BTN}
    Page Finished Loading

Verify Successfully Updated Record
    Wait Until Element Is Visible       ${DATA_SUCCESSFULLY_UPDATED_MSG}    ${visibilityTimeOut}
    Previous screen will be displayed

Verify Truck Roll listing page will be displayed After Editing
    Verify Search Result        [1]     ${TRUCK_ROLL_INT_TEST_NO_OF_DAYS_DATA3}
    Verify Search Result        [2]     ${TRUCK_ROLL_INT_TEST_NO_OF_VISITS_DATA3}
    Capture Page Screenshot


Verify are you sure want to delete this
    Wait Until Element Is Visible        ${ARE_U_SURE_DELETE_THIS_MSG}         ${visibilityTimeOut}
    Capture Page Screenshot

Click Confirm at the notification message
   Click Element           ${DELETE_CONFIRM_BTN}
    Page Finished Loading

#Verify Record not displayed After Deleting
Verify Successfully Deleted Record
    Wait Until Element Is Visible       ${DATA_SUCCESSFULLY_DELETED_MSG}        ${visibilityTimeOut}
    Capture Page Screenshot

Verify Record not displayed After Deleting
    Verify Record Is Deleted In Search Result       [1]     ${TRUCK_ROLL_INT_TEST_NO_DAYS_DATA}
    Verify Record Is Deleted In Search Result       [2]     ${TRUCK_ROLL_INT_TEST_NO_VISITS_DATA}

Enter Zero values for No of Visits
    Input Text In Textfield     No.of Visits      ${ZERO_VALUE}

Enter Zero values for No of Days
    Input Text In Textfield     No.of Days      ${ZERO_VALUE}

Verify message truck roll with the same values is already exist
    Wait Until Element Is Visible       ${SAME_VALUE_ALREADY_EXIST_MSG}     ${visibilityTimeOut}
    Capture Page Screenshot

Verify Error Message
     Wait Until Element Is Visible       ${SAME_VALUE_ALREADY_EXIST_MSG}     ${visibilityTimeOut}
    Capture Page Screenshot

Click Clear
    Click Element       ${CLEAR_BTN}

The no of days values entered should be cleared successfully
    Verify Data Cleared     Value       ${TRUCK_ROLL_INT_TEST_NO_DAYS_DATA}

The no of visits values entered should be cleared successfully
    Verify Data Cleared     Value       ${TRUCK_ROLL_INT_TEST_NO_VISITS_DATA}

The no of visits in advanced search entered should be cleared successfully
    Verify Data Cleared     No. of Visits:       ${TRUCK_ROLL_INT_TEST_NO_VISITS_DATA}

The no of days in advanced search entered should be cleared successfully
    Verify Data Cleared     No. of Days:       ${TRUCK_ROLL_INT_TEST_NO_VISITS_DATA}

At Advanced Search tab, enter values at both No of Days and No of Visits
    Input an integer from no of visits at search No of Visits in Truck Roll Advanced Search
    Input an integer from no of days at search No of Days in Truck Roll Advanced Search



The no of days and visits in advanced search entered should be cleared successfully
    The no of days in advanced search entered should be cleared successfully
    The no of visits in advanced search entered should be cleared successfully




