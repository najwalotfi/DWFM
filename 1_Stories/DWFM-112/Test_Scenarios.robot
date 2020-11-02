*** Settings ***
Documentation     DWFM-112: Contractor Management/Multi Tenancy
...               23 October 2020
...               Atikah Mohd Amin
Resource          Keywords.robot

*** Test Cases ***

DWFM112_TC1
    [Documentation]    To verify user can create staff employee record.

    Login to DWFM
    From Administration Go To Create Section
    Verify navigated to create user page
    Randomize Account Name
    Enter all staff employee details
    Click Create in Create User
    Verify Staff Employee Created Successfully
    Login to Keycloak
    Navigate to Users
    Search User Name In Keycloak
    Verify User Is Listed in Search Result
    Verify that the information for the staff employee is correct
    [Teardown]      Close Browser


DWFM112_TC3
    [Documentation]    To verify user can create contrator user record.

    Login to DWFM
    From Administration Go To Create Section
    ##workaround
    Scroll To Element    ${OWNER_DDL}
    Click Element       ${OWNER_DDL}
    From Workforce Go To Company Profile In Control Panel
    Verify Data Populated in Company Profile Search Results
    From Administration Go To Create Section
    ##end workaround
   Select Value From Owner Drop Down List
    Randomize Account Name for Contractor
    Enter all contractor employee details
    Login to Keycloak
    Navigate to Users
    Search Contractor User Name In Keycloak
    Verify User Is Listed in Search Result
    Verify that the information for the contractor is correct
    [Teardown]      Close Browser

DWFM112_TC7
    [Documentation]    To verify that the Owner column displays the correct list of contractor company

    Login to DWFM
    From Administration Go To Create Section
    ##workaround
    Scroll To Element    ${OWNER_DDL}
    Click Element       ${OWNER_DDL}
    From Workforce Go To Company Profile In Control Panel
    Search all contractor companies by entering the Search By and the corresponding Value
    All contractor companies will be displayed at the search listing table
    From Administration Go To Create Section
    ##end workaround
    Click on the Owner drop down list
    Verify all the contractor companies listed in the drop down
    [Teardown]      Close Browser


DWFM112_TC8
    [Documentation]    To verify that Owner drop down should reflect any updates in contractor (name, Is Contractor) or delete of contractor record in Control Pane > Company Profile

    Login to DWFM
    From Workforce Go To Company Profile In Control Panel
    Click Edit on one of the contractor
    Update Company Profile screen will be displayed
    Edit the Name
    click Update button
    Verify The contractor Name will be updated successfully
    Close Browser
    Login to DWFM
    From Administration Go To Create Section
    ##workaround
    Scroll To Element    ${OWNER_DDL}
    Click Element       ${OWNER_DDL}
    From Workforce Go To Company Profile In Control Panel
    Search all contractor companies by entering the Search By and the corresponding Value
    All contractor companies will be displayed at the search listing table
    From Administration Go To Create Section
    ##end workaround
    Click on the Owner drop down list
    Verify The Owner drop down list should display the updated contractor name
    Close Browser
    Login to DWFM
    From Workforce Go To Company Profile In Control Panel
    Input Text In Filter        ${EDITED_NEW_COMPANY_NAME_DATA}
    Click Edit on one of the contractor
    Update Company Profile screen will be displayed
    Edit the Is Contractor from Y to N
    click Update button
    Close Browser
    Login to DWFM
    From Administration Go To Create Section
    ##workaround
    Scroll To Element    ${OWNER_DDL}
    Click Element       ${OWNER_DDL}
    From Workforce Go To Company Profile In Control Panel
    Search all contractor companies by entering the Search By and the corresponding Value
    All contractor companies will be displayed at the search listing table
    From Administration Go To Create Section
    ##end workaround
    Click on the Owner drop down list
    Verify The Owner drop down list should not display the contractor
    Close Browser
     Login to DWFM
    From Workforce Go To Company Profile In Control Panel
    Click Edit on one of the contractor
    Update Company Profile screen will be displayed
    Click Create In Company Profile
    Create New Contractor Company Profile
    Click Delete on one of the contractor
    Verify Contractor Deleted Successfully
    Close Browser
    Login to DWFM
    From Administration Go To Create Section
    ##workaround
    Scroll To Element    ${OWNER_DDL}
    Click Element       ${OWNER_DDL}
    From Workforce Go To Company Profile In Control Panel
    Search all contractor companies by entering the Search By and the corresponding Value
    All contractor companies will be displayed at the search listing table
    From Administration Go To Create Section
     Click on the Owner drop down list
    Verify The Owner drop down list should not display the deleted contractor

    [Teardown]      Change back edited contractor name

DWFM112_TC9
    [Documentation]     To verify user cannot create duplicate staff employee record.

    Login to DWFM
    From Administration Go To Create Section
    Verify navigated to create user page
    Randomize Account Name
    Enter all staff employee details
    Click Create in Create User
    Verify Staff Employee Created Successfully
    Enter all staff employee details
    Click Create in Create User
    Verify Staff Employee Created Successfully
    Login to Keycloak
    Navigate to Users
    Search User Name In Keycloak
    Verify User Is Listed in Search Result
    Verify that the information for the staff employee is correct
    Verify that only one staff record is created

    [Teardown]      Change back edited contractor name

DWFM112_TC10
    [Documentation]     To verify user cannot create duplicate contractor record.

    Login to DWFM
    From Administration Go To Create Section
    ##workaround
    Scroll To Element    ${OWNER_DDL}
    Click Element       ${OWNER_DDL}
    From Workforce Go To Company Profile In Control Panel
    Verify Data Populated in Company Profile Search Results
    From Administration Go To Create Section
    ##end workaround
    Select Value From Owner Drop Down List
    Randomize Account Name for Contractor
    Enter all contractor employee details
    Click Create in Create User
    Verify Staff Employee Created Successfully
    Close Browser
    Login to DWFM
    From Administration Go To Create Section
    ##workaround
    Scroll To Element    ${OWNER_DDL}
    Click Element       ${OWNER_DDL}
    From Workforce Go To Company Profile In Control Panel
    Verify Data Populated in Company Profile Search Results
    From Administration Go To Create Section
    ##end workaround
    Select Value From Owner Drop Down List
    Randomize Account Name for Contractor
    Enter all contractor employee details
    Click Create in Create User
    Verify Staff Employee Created Successfully
    Login to Keycloak
    Navigate to Users
    Search Contractor User Name In Keycloak
    Verify User Is Listed in Search Result
    Verify that the information for the contractor is correct

    [Teardown]      Close Browser












