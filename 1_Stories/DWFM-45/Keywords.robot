*** Settings ***
Library           String
Library           Collections
Resource          ../../2_Common/Generic_Resources/dwfm_resources.robot

*** Keywords ***
 Click Create in Work Order
    Click Create        Search Results      Search Results
    Page Finished Loading

Enter data for all input fields in the Create Work Order page
    Wait Until Page Contains Element        ${CREATE_WORK_ORDER_HEADER}     ${visibilityTimeOut}
    Choose Value From Drop Down List        Work Order Type                 ${WORK_ORDER_TYPE_DATA}
    Input Text In Textfield                 Order No.                       ${ORDER_NO_DATA}
    Input Text In Textfield                 Serivce ID                      ${SERVICE_ID_DATA}
    Choose Value From Drop Down List        Product Category                ${PRODUCT_CATEGORY_DATA}
    Choose Value From Drop Down List        Product                         ${PRODUCT_DATA}
    Input Text In Textfield                 Customer ID                     ${CUSTOMER_ID_DATA}
    Generate Random Customer Name
    Input Text In Textfield                 Customer Name                   ${CUSTOMER_NAME_DATA}
    Input Text In Textfield                 Contact Name                    ${CUSTOMER_NAME_DATA}
    Generate Random Contact No
    Input Text In Textfield                 Contact Number                  ${CONTACT_NO_DATA}
    Generate Random Customer Email
    Input Text In Textfield                 Contact Email Address           ${CUSTOMER_EMAIL_DATA}
    Choose Value From Drop Down List        Language                        ${LANGUAGE_DATA}
    Scroll To Element                       ${LOCATION_CURRENT_TAB}
    Input Text In Textfield                 Postal Code                     ${POSTAL_CODE_DATA}
    Input Text In Textfield                 Building Number                 ${BUILDING_NO_DATA}
    Input Text In Textfield                 Floor #                         ${FLOOR_NO_DATA}
    Input Text In Textfield                 Unit / Apartment #              ${UNIT_NO_DATA}
    Input Text In Textfield                 Street # / Name                 ${STREET_NAME_DATA}
    Input Text In Textfield                 Latitude                        ${LATITUDE_DATA}
    Input Text In Textfield                 Longitude                       ${LONGITUDE_DATA}

At the Task section, untick the Automatically Create Service Work check box
    Choose Option in Checkbox           Automatically Create Service Work
    Verify Checkbox Is Unchecked
    Capture Page Screenshot

At the Task section, ensure the Automatically Create Service Work check box is ticked
    Verify Checkbox Is Checked
    Capture Page Screenshot

At the Task section, click Add Task hyperlink
    Click Element       ${ADD_TASK_LINK}
    Wait Until Page Contains Element        ${ADD_TASK_POPUP_HEADER}        ${visibilityTimeOut}
    Capture Page Screenshot

Enter data for all input fields and click Submit to create a task
    Input Text In Textfield     Name        ${TASK_NAME_DATA}
    Input Text In Textfield     Description     ${TASK_DESCRIPTION_DATA}
    Input Text In Textfield     Preparation Duration (min)      ${PREP_DURATION_DATA}
    Input Text In Textfield     Work Duration (at least 1 min)  ${WORK_DURATION_DATA}
    Input Text In Textfield     Required No. of Lead Day/s      ${LEAD_DAYS_DATA}
    Choose Value From Drop Down List    Required Skill          ${REQUIRED_SKILLS_DATA}
    element should be enabled       ${SUBMIT_BTN}
    Click Element                   ${SUBMIT_BTN}
    Verify Task Created

Enter data for all input fields and click Submit to create a task2
    Input Text In Textfield     Name        ${TASK_NAME_DATA2}
    Input Text In Textfield     Description     ${TASK_DESCRIPTION_DATA2}
    Input Text In Textfield     Preparation Duration (min)      ${PREP_DURATION_DATA2}
    Input Text In Textfield     Work Duration (at least 1 min)  ${WORK_DURATION_DATA2}
    Input Text In Textfield     Required No. of Lead Day/s      ${LEAD_DAYS_DATA2}
    Choose Value From Drop Down List    Required Skill          ${REQUIRED_SKILLS_DATA2}
    element should be enabled       ${SUBMIT_BTN}
    Click Element                   ${SUBMIT_BTN}
    Verify Task Created2

Verify Task Created
    Wait Until Page Contains Element    ${TASK_CREATED_IN_TABLE}        ${visibilityTimeOut}

Verify Task Created2
    Wait Until Page Contains Element    ${TASK_CREATED_IN_TABLE2}        ${visibilityTimeOut}

At the Appoinment section, click the Calendar button
    Click Element       ${SCHEDULE_DATE_TIME_CALENDAR_BTN}
    Wait Until Page Contains Element    ${APPMNT_SCHEDULE_POPUP_HEADER}    ${visibilityTimeOut}

Select or Book an Appointment schedule or timeslot and click Submit button
    Get Time Slot Available
    Click Element           ${APPMNT_SCHEDULE_TIME_SLOT}
    Click Element           ${SUBMIT_BTN}
    Wait Until Element Is Not Visible     ${APPMNT_SCHEDULE_POPUP_HEADER}   ${visibilityTimeOut}

Verify Appoinmtent schedule or timeslot is booked successful
    Page Should Contain Element    //div[@class= 'input-group']//input[contains(@ng-reflect-model, '${TIME_SLOT}')]

Enter Priority for the appointment (optional)
    Input Text In Textfield         Priority (1-Lowest, 100-Highest)        ${PRIORITY_DATA}


Get Time Slot Available
    ${timeSlot} =       Get Text        ${APPMNT_SCHEDULE_TIME_SLOT}
    Set Suite Variable    ${TIME_SLOT}      ${timeSlot}
    log     ${TIME_SLOT}

Click Submit button to create the work order
    Click Element       ${SUBMIT_BTN}

Verify Work Order After Submitted
    Work Order together with a task will be created successfully
    User will be directed to Work Order listing page again

Work Order together with a task will be created successfully
    Wait Until Page Contains Element       ${SUCCESSFULLY_CREATED_WORK_ORDER_MSG}       ${visibilityTimeOut}
    Click Element       ${DATA_RESET_CLOSE_BTN}

User will be directed to Work Order listing page again
    Page Should Contain Element     ${WORK_ORDER_HEADER}

At the Work Order, go to the listing table and observe the newly created work order
    Scroll To Element       ${SEARCH_RESULTS_HEADER}
    INPUT TEXT IN FILTER    Search Results    ${CUSTOMER_NAME_DATA}
    Verify Search Result        [2]           ${CUSTOMER_NAME_DATA}
    Page Should Contain Element     ${STATUS_IN_PROGRESS}
    Capture Page Screenshot

At the Action column, click Details hyperlink
    Click Element       ${DETAILS_LINK1}
    Page Finished Loading
    Capture Page Screenshot









Generate Random Customer Name
    ${customerRandomNo} =    Generate Random String    3    [NUMBERS]
    ${customerRandomString} =    Generate Random String    5    [UPPER]
    ${concateCustName} =    Catenate    SEPARATOR=    AUTOCUSTNAME   -    ${customerRandomString}     -    ${customerRandomNo}
    log    ${concateCustName}
    Set Suite Variable    ${CUSTOMER_NAME_DATA}    ${concateCustName}

Generate Random Contact No
   ${contactNo} =    Generate Random String    8    [NUMBERS]
   ${concateConNo} =    Catenate    SEPARATOR=    60   -   ${contactNo}
   Set Suite Variable    ${CONTACT_NO_DATA}    ${concateConNo}

Generate Random Customer Email
    ${custEmail} =      Catenate    SEPARATOR=    ${CUSTOMER_NAME_DATA}     @gmail.com
    Set Suite Variable    ${CUSTOMER_EMAIL_DATA}    ${custEmail}


