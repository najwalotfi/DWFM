*** Settings ***
Library           String
Library           Collections
Resource          ../../2_Common/Generic_Resources/dwfm_resources.robot

*** Keywords ***
Access Batch Details From Control Panel
   Click Element        ${WORKFORCE_DDL}
   Wait Until Element Is Visible        ${WORK_MANAGEMENT_SUB_MENU_HEADER}       30s
   Scroll to Element    ${CONTROL_PANEL_SUB_LEVEL}
   Click Element        ${CONTROL_PANEL_SUB_LEVEL}
   Page Finished Loading
    Wait Until Element Is Visible       ${CONTROL_PANEL_PAGE_HEADER}     30s
    Click Element       ${BATCH_MANAGEMENT_DATATABLE}
    Page Finished Loading
    Wait Until Element Is Visible       ${BATCH_MANAGEMENT_HEADER}  30s
    Capture Page Screenshot







    
