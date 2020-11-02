*** Settings ***
Library           BuiltIn
Library           SeleniumLibrary
Library           String
Library           OperatingSystem
Library           Process
Library           Collections
Library           DateTime
Resource          generic_variables.robot
Resource          ../Web_Elements/Batch_Mgmt_Element.robot
Resource          ../Web_Elements/Homepage_Element.robot
Resource          ../Web_Elements/Control_Panel_Element.robot
Resource          ../Page_Objects/Homepage/Homepage.robot
Resource          ../Page_Objects/General/Generic_Keyword_Library.robot
Resource          ../Test_Data/DWFM_Batch_Mgmt_Data.robot
Resource          ../../1_Stories/DWFM-1/Keywords.robot
Resource          ../../1_Stories/DWFM-29/Keywords.robot
Resource          ../Web_Elements/Device_Element.robot
Resource          ../../1_Stories/DWFM-30/Keywords.robot
Resource          ../Web_Elements/Work_Order_Element.robot
Resource          ../../1_Stories/DWFM-38/Keywords.robot
Resource          ../Web_Elements/Truck_Roll_Element.robot
Resource          ../../1_Stories/DWFM-39/Keywords.robot
Resource          ../Web_Elements/Appointment_Element.robot
Resource          ../../1_Stories/DWFM-45/Keywords.robot
Resource          ../../1_Stories/DWFM-47/Keywords.robot
Resource          ../Web_Elements/Tech_Roster_Element.robot
Resource          ../../1_Stories/DWFM-52/Keywords.robot
Resource          ../Web_Elements/Manual_Assignment_Element.robot
Resource          ../../1_Stories/DWFM-110/Keywords.robot
Resource          ../Web_Elements/Resolution_Code_Element.robot
Resource          ../../1_Stories/DWFM-9/Keywords.robot
Resource          ../Web_Elements/Admin_Create_Element.robot
Resource          ../../1_Stories/DWFM-112/Keywords.robot



*** Keywords ***
Login to DWFM
   Open Browser    ${url}      ${browser}
   Maximize Browser Window
   Input Text       ${USERNAME_TEXTFIELD}            ${username}
   Input Text       ${PASSWORD_TEXTFIELD}    ${password}
   Click Element    ${LOGIN_BTN}
   Reload If Page Failed To Load
   Page Loaded Successfully
   Capture Page Screenshot

Login to DWFM with Incorrect Username
   Open Browser    ${url}      ${browser}
   Maximize Browser Window
   Input Text       ${USERNAME_TEXTFIELD}          ${incorrect_username}
   Input Text       ${PASSWORD_TEXTFIELD}     ${password}
   Click Element    ${LOGIN_BTN}
   Wait Until Page Contains Element     ${INVALID_USERNAME_PASSWORD_ALERT}     ${visibilityTimeOut}
   Capture Page Screenshot

Login to DWFM with Incorrect Password
   Open Browser    ${url}      ${browser}
   Maximize Browser Window
   Input Text       ${USERNAME_TEXTFIELD}            ${username}
   Input Text       ${PASSWORD_TEXTFIELD}     ${incorrect_password}
   Click Element    ${LOGIN_BTN}
   Wait Until Page Contains Element     ${INVALID_USERNAME_PASSWORD_ALERT}     ${visibilityTimeOut}
   Capture Page Screenshot

Login to Keycloak
    Open Browser    ${urlkeycloak}      ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${KC_ADMINISTRATION_CONSOLE}       ${visibilityTimeOut}
    Click Element                    ${KC_ADMINISTRATION_CONSOLE}
    Wait Until Element Is Visible    ${KC_LOGIN_PAGE}        ${visibilityTimeOut}
    Input Text      ${KC_USERNAME_TEXTFIELD}        ${usernameKC}
    Input Text      ${KC_PASSWORD_TEXTFIELD}        ${passwordKC}
    Click Element   ${KC_LOGIN_BTN}
    Wait Until Element Is Visible    ${KC_LOGO}     ${visibilityTimeOut}
