*** Settings ***
Documentation     DWFM-32: DWFM Menu
...               05 October 2020
...               Atikah Mohd Amin
#Resource          Keywords.robot
Resource          ../../2_Common/Generic_Resources/dwfm_resources.robot
Library     SeleniumLibrary
Library    DataDriver    file=Test_DWFM_Menu.xlsx    sheet_name=Sheet1
Test Template       Click Workforce and Access Sub Menu

*** Test Case ***
Test ${testCaseNo}_Verify DWFM ${menuName} Menu
    [Documentation]   To verify that when user is assigned with capability or role 1, he/she can view ${menuName} menu from the Workforce drop down menu.


#DWFM-32_07
#    [Documentation]    Access_Map_and_Location
#     Login to DWFM
#     Click at Map Location under Work Force

*** Keywords ***
Click Workforce and Access Sub Menu
    [Arguments]    ${subMenu}      ${menuName}      ${pageHeaderName}

    Login To DWFM
    Access Sub Menu From Workforce      ${subMenu}   ${menuName}
     Wait Until Element Is Visible       //h5[contains(., '${pageHeaderName}')]     30s
    Page Should Contain Element     //h5[contains(., '${pageHeaderName}')]
    Capture Page Screenshot
    Close Browser

Click at Map Location under Work Force
       Click Element        ${WORKFORCE_DDL}
   Wait Until Element Is Visible        //div[contains(@class, 'sub-menu-header')]//a/span[contains(., "Work Management")]      30s
   Scroll to Element    //nav[contains(@class, 'sub-level')]//a/span[contains(., 'Map and Location')]
   Click Element        //nav[contains(@class, 'sub-level')]//a/span[contains(., "Map and Location")]
   Page Finished Loading
    Wait Until Element Is Visible         ${SHOW_SUBSTATION_LABEL}     30s
    Page Should Contain Element     ${SHOW_SUBSTATION_LABEL}
    Capture Page Screenshot
    Close Browser



