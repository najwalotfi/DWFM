*** Settings ***
Library           String
Library           Collections
Resource          ../../2_Common/Generic_Resources/dwfm_resources.robot

*** Keywords ***
Click at Work Order under Work Force
    Access Sub Menu From Workforce      Work Management     Work Order
    Page Should Contain Element     ${WORK_ORDER_HEADER}

Observe the Quick Search Tab is available
    Page Should Contain Element     ${QUICK_SEARCH_TAB_ENABLED}
    Capture Page Screenshot

Verify Search By Drop Down List Showing Appointment ID
    Choose Value From Drop Down List        Search By       Appointment ID
    Capture Page Screenshot

Enter Appointmet ID Value
    Get Appointment ID
    Input Text In Textfield     Value       ${APPMNT_ID_SEARCH_RESULT1}
    Capture Page Screenshot

Get Appointment ID
   ${appmtIDSearchResult1} =         Get Text       ${APPMNT_ID_FIRST_SEARCH_RESULT}
    Set Suite Variable      ${APPMNT_ID_SEARCH_RESULT1}       ${appmtIDSearchResult1}

Click Search
    Click Element       ${SEARCH_BTN}
    Page Finished Loading

Verify Search Result Return Exact Match
    Scroll To Element               ${search_results_header}
    Page Should Contain Element     (//div[@class='datatable-body-cell-label']//span[contains(., '${APPMNT_ID_SEARCH_RESULT1}')])[1]
    Capture Page Screenshot

Click on "Advance Search" tab
    select tab    Advanced Search
    Capture Page Screenshot

Verify Appointment ID Before Work Order ID
    Page Should Contain Element     ${APPMT_ID_B4_WORK_ORDER_ID}
    Capture Page Screenshot

Verify maximum 4 input field per row at "Advance Search" tab
    Capture Page Screenshot

Input Appointment ID in Numeric
    Get Appointment ID
    Input Text In Textfield in Advanced Search       Appointment ID      ${APPMNT_ID_SEARCH_RESULT1}

Verify the Appointment ID text in numeric is entered
    Textfield Value Should Be       ${APPMT_ID_TEXTFIELD}       ${APPMNT_ID_SEARCH_RESULT1}
    Capture Page Screenshot

Observed the Work Order Listing page populated
    Scroll To Element   ${WORK_ORDER_LISTING}
    Capture Page Screenshot

Verify Search result should show Appointment ID column and data before Appointment Date
    Page Should Contain Element     ${APMNT_ID_B4_APPMNT_DATE}
    Capture Page Screenshot

Click Export in Work Order
    Click Export    Search Results      Search Results

Verify Excel Sheet Downloaded
    Press Keys      //a/crmx-logo      CTRL+J
    Sleep   3s
    Capture Page Screenshot

Access Work Order Detail
      Click Element       ${DETAILS_LINK1}
      Capture Page Screenshot
      Wait Until Element Is Visible     ${WORK_ORDER_DETAIL_HEADER}     ${visibilityTimeOut}

Verify Appointment ID Before Appointment Date in Work Order Detail
    Page Should Contain Element     ${APPMNT_ID_B4_APPNMT_DATE_WORK_ORDER_DETAILS}
    Capture Page Screenshot

