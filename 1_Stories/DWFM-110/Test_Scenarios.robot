*** Settings ***
Documentation     DWFM-110: Control Panel - Resolution Code
...               20 October 2020
...               Atikah Mohd Amin
Resource          Keywords.robot

*** Test Cases ***

DWFM110_TC1
    [Documentation]    To verify that Resolution Code exists under Workforce > Control Panel (Work Management)

    Login to DWFM
    From Workforce Go To Resolution Code Section In Control Panel
    Verify Resolution Code page will be displayed

    [Teardown]      Close Browser

DWFM110_TC2
    [Documentation]    To verify user can create new Resolution Code record

    Login to DWFM
    From Workforce Go To Resolution Code Section In Control Panel
    Verify Resolution Code page will be displayed
    Click Create in Resolution Code
    Verify Create pop-up screen will be displayed
    Enter Name and Code in Resolution Code
    Click Create Button in Create Resolution Code Popup
    Verify Message displayed informs that the new record is created successfully
    Verify the new record is displayed in the resolution code table

    [Teardown]      Close Browser

DWFM110_TC3
    [Documentation]    To verify user can edit both fields Name and Code (in one transaction) for an existing record.

    Login to DWFM
    From Workforce Go To Resolution Code Section In Control Panel
    Verify Resolution Code page will be displayed
    Filter Existing Resolution Code     ${RC_NAME_DATA}
    Click Edit at the resolution code record
    Resolution Code Edit pop-up screen will be displayed
    Existing information will be displayed in Resolution Code Edit Popup
    Edit Name Textfield in Resolution Code Popup
    Edit Code Textfield in Resolution Code Popup
    Click Update in Resolution Code Popup
    Verify Message displayed informs that the new record is updated successfully
    Verify the updated record is displayed in the resolution code table

    [Teardown]      Close Browser

DWFM110_TC4
    [Documentation]    To verify user can edit fields Name or Code (one transaction for each field) for an existing record

    Login to DWFM
    From Workforce Go To Resolution Code Section In Control Panel
    Verify Create pop-up screen will be displayed
    Create Another Resolution Code
    Filter Existing Resolution Code     ${RC_NAME_DATA2}
    Click Edit at the resolution code record
    Resolution Code Edit pop-up screen will be displayed
    Existing information will be displayed in Resolution Code Edit Popup 2
    Edit Name Textfield in Resolution Code Popup 2
    Click Update in Resolution Code Popup
    Verify Message displayed informs that the new record is updated successfully
    Verify the updated name is displayed in the resolution code table
    Filter Existing Resolution Code     ${RC_CODE_DATA2}
    Click Edit at the resolution code record
    Resolution Code Edit pop-up screen will be displayed
    Edit Code Textfield in Resolution Code Popup 2
    Click Update in Resolution Code Popup
    Verify Message displayed informs that the new record is updated successfully
    Verify the updated code is displayed in the resolution code table

    [Teardown]      Close Browser

DWFM110_TC5
    [Documentation]   To verify user can change the Resolution Code from Active to Inactive, if the Code is not being used in other tables

    Login to DWFM
    From Workforce Go To Resolution Code Section In Control Panel
    Verify Resolution Code page will be displayed
    Filter Existing Resolution Code     ${EDIT_RC_NAME_DATA2}
    Click Edit at the resolution code record
    Resolution Code Edit pop-up screen will be displayed
    Change Status from Active to Inactive
    Click Update in Resolution Code Popup
    Verify Message displayed informs that the new record is updated successfully
    Filter Existing Resolution Code     ${EDIT_RC_NAME_DATA2}
    Verify Status is Inactive

    [Teardown]      Close Browser

DWFM110_TC6
    [Documentation]   To verify user cannot change the Resolution Code from Active to Inactive, if the Code is  being used in other tables

    Login to DWFM
    From Workforce Go To Resolution Code Section In Control Panel
    Verify Resolution Code page will be displayed
    Filter Existing Resolution Code     ${REFERRED_RC_NAME_DATA}
   Click Edit at the resolution code record
    Resolution Code Edit pop-up screen will be displayed
    Change Status from Active to Inactive
    Click Update in Resolution Code Popup
    Verify Message displayed informs that the new record is updated successfully
    Filter Existing Resolution Code      ${REFERRED_RC_NAME_DATA}
    Verify Status is Inactive

    [Teardown]      Close Browser

DWFM110_TC7
    [Documentation]   To verify user can change the Resolution Code from Inactive to Active

    Login to DWFM
    From Workforce Go To Resolution Code Section In Control Panel
    Verify Resolution Code page will be displayed
    Filter Existing Resolution Code     ${REFERRED_RC_NAME_DATA}
    Click Edit at the resolution code record
    Resolution Code Edit pop-up screen will be displayed
    Change Status from Inactive to Active
    Verify Status is Active

        [Teardown]      Close Browser

DWFM110_TC8
    [Documentation]   To verify user cannot create or edit record using a duplicate Name

    Login to DWFM
    From Workforce Go To Resolution Code Section In Control Panel
    Verify Resolution Code page will be displayed
    Click Create in Resolution Code
    Verify Create pop-up screen will be displayed
    Enter Duplicate Name and New Code in Resolution Code
    Verify Error Message Name Is Duplicate
    Verify Create Button Is Disable in Create Resolution Code
    Click Cancel in Create Resolution Code
    Verify No Duplicated Name Record Is Created in Resolution Code
    Filter Existing Resolution Code     ${EDIT_RC_NAME_DATA}
    Click Edit at the resolution code record
    Resolution Code Edit pop-up screen will be displayed
    Edit Name To Duplicate Name
   Verify Error Message Name Is Duplicate
    Verify Create Button Is Disable in Create Resolution Code
    Click Cancel in Create Resolution Code
    Verify No Duplicated Edited Name Record Is Created in Resolution Code

    [Teardown]      Close Browser

DWFM110_TC9
    [Documentation]   To verify user can create or edit record using a duplicate Code

    Login to DWFM
    From Workforce Go To Resolution Code Section In Control Panel
    Verify Resolution Code page will be displayed
    Click Create in Resolution Code
    Verify Create pop-up screen will be displayed
    Enter Duplicate Code and New Name in Resolution Code
    Verify Create Resolution Code Button Is Enable
    Click Cancel in Create Resolution Code
    Verify No Duplicated Code Record Is Created in Resolution Code
    Filter Existing Resolution Code     ${EDIT_RC_CODE_DATA}
    Click Edit at the resolution code record
    Resolution Code Edit pop-up screen will be displayed
    Edit Code To Duplicate Code
    Verify Create Resolution Code Button Is Enable
    Click Cancel in Create Resolution Code
    Verify No Duplicated Edited Code Record Is Created in Resolution Code

    [Teardown]      Close Browser

DWFM110_TC10
    [Documentation]   To verify the look and feel of Resolution Code page is following the latest UI/UX style guide

    Login to DWFM
    From Workforce Go To Resolution Code Section In Control Panel
    Verify Resolution Code page will be displayed

    [Teardown]      Close Browser

DWFM110_TC11
    [Documentation]   To verify user can delete existing Resolution Code record,  Status = Active and if the record is not used by other tables

    Login to DWFM
    From Workforce Go To Resolution Code Section In Control Panel
    Verify Create pop-up screen will be displayed
    Create Resolution Code To Be Deleted
    Filter Existing Resolution Code     ${RC_NAME_DATA5}
    Click Delete in Resolution Code
    Verify Message displayed informs that the new record is deleted successfully
    Click OK to confirm the deletion
    Verify The record will be removed from the listing table

    [Teardown]      Close Browser

DWFM110_TC12
    [Documentation]   To verify user cannot delete existing Resolution Code record,  Status = Active and if the record is used or referred by other tables

    Login to DWFM
    From Workforce Go To Resolution Code Section In Control Panel
    Verify Create pop-up screen will be displayed
    Filter Existing Resolution Code     ${REFERRED_RC_NAME_DATA}
    Click Delete in Resolution Code
    Verify the record cannot be deleted and is being used by other tables
    Click OK To Cannot Delete Message
    Verify the referred record will not be deleted from listing table

    [Teardown]      Close Browser

DWFM110_TC13
    [Documentation]   To verify user can delete existing Resolution Code record, Status = Inactive and if the record is not used by other tables

    Login to DWFM
    From Workforce Go To Resolution Code Section In Control Panel
    Verify Create pop-up screen will be displayed
    Create Inactive Resolution Code To Be Deleted
    Change Newly Created Record to Inactive
    Filter Existing Resolution Code     ${RC_NAME_DATA6}
    Click Delete in Resolution Code
    Verify Message displayed informs that the new record is deleted successfully
    Click OK to confirm the deletion
    Verify The inactive record will be removed from the listing table

    [Teardown]      Close Browser

DWFM110_TC14
    [Documentation]   To verify user cannot delete existing Resolution Code record,  Status = Inactive and if the record is used or referred by other tables

    Login to DWFM
    From Workforce Go To Resolution Code Section In Control Panel
    Verify Create pop-up screen will be displayed
    Filter Existing Resolution Code     ${REFERRED_RC_NAME_DATA}
    Click Edit at the resolution code record
    Resolution Code Edit pop-up screen will be displayed
    Change Status from Active to Inactive
    Click Update in Resolution Code Popup
    Filter Existing Resolution Code      ${REFERRED_RC_NAME_DATA}
    Verify Status is Inactive
     Click Delete in Resolution Code
    Verify the record cannot be deleted and is being used by other tables
    Click OK To Cannot Delete Message
    Verify the referred record will not be deleted from listing table

    [Teardown]      Change back status to active