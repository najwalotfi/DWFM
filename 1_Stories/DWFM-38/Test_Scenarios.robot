*** Settings ***
Documentation     DWFM-38: Truck Roll
...               02 October 2020
...               Atikah Mohd Amin
Resource          Keywords.robot

*** Test Cases ***

DWF38_TC1
    [Documentation]   To verify that when Field Controller clicked on "Truck Roll" hyperlink at Control Panel, Truck Roll "Listing Page" landing page will be displayed

    Login to DWFM
    From Workforce Go To Truck Roll Section In Control Panel
    Verify Directed to Truck Roll Listing Page Successfully
    [Teardown]      Close Browser

DWFM38_TC2
    [Documentation]     To verify "Search" and "Advanced Search" tabs as well as "Search Result" section will be displayed in "Listing Page" landing page

    Login to DWFM
    From Workforce Go To Truck Roll Section In Control Panel
    Observe Quick Search and Advance Search tabs in Truck Roll
    Observe Search Result section in Truck Roll
    [Teardown]      Close Browser


DWFM38_TC4
    [Documentation]     To verify "Listing Page" "Search" tab contains "Search By"

     Login to DWFM
    From Workforce Go To Truck Roll Section In Control Panel
    Go To Quick Search Tab Section in Truck Roll
    Click on Search By Drop Down List
    Verify The listing or selection should include No of Days and No of Visits
    [Teardown]      Close Browser

DWFM38_TC5
    [Documentation]     To verify user can search by "No of Days" and the search "Value" should only be in integer

    Login to DWFM
    From Workforce Go To Truck Roll Section In Control Panel
    Go To Quick Search Tab Section in Truck Roll
    Click on Search By and select No of Days
    Attempt to enter alphabets at search Value
    Attempt to enter special characater at search Value
    Input An Integer From No Of Days At Search Value
    Click Search
    Verify No OF Days Search Result in Truck Roll When Search Using Integer
    [Teardown]      Close Browser

DWFM38_TC6
    [Documentation]     To verify user can search by "No of Visits" and the search "Value" should only be in integer.

    Login to DWFM
    From Workforce Go To Truck Roll Section In Control Panel
    Go To Quick Search Tab Section in Truck Roll
    Click on Search By and select No of Visits
    Attempt to enter alphabets at search Value
    Attempt to enter special characater at search Value
    Input an integer from no of visits at search Value
    Click Search
    Verify No OF Visits Search Result in Truck Roll When Search Using Integer
    [Teardown]      Close Browser

DWFM38_TC7
    [Documentation]     To verify "Listing Page" "Advanced Search" tab contains "No of Days" and "No of Visits" input fields

    Login to DWFM
    From Workforce Go To Truck Roll Section In Control Panel
    Go To Advanced Search Tab Section In Truck Roll
    Verify No of Days and Visits Textfield Are Displayed
    [Teardown]      Close Browser

DWFM38_TC8
    [Documentation]     To verify user can search via "Advanced Search" tab and "No of Days" and "No of Visits" input fields should only be in integer.

    Login to DWFM
    From Workforce Go To Truck Roll Section In Control Panel
    Go To Advanced Search Tab Section In Truck Roll
    Attempt to enter alphabets at search No Of Visits in Truck Roll Advanced Search
    Attempt to enter special characater at search No of Visits in Truck Roll Advanced Search
    Input an integer from no of visits at search No of Visits in Truck Roll Advanced Search
     Click Search
    Verify No OF Visits Search Result in Truck Roll When Search Using Integer
    [Teardown]      Close Browser

DWFM38_TC9
    [Documentation]     To verify user can search via "Advanced Search" tab and "No of Days" and "No of Visits" input fields should only be in integer.

    Login to DWFM
    From Workforce Go To Truck Roll Section In Control Panel
    Go To Advanced Search Tab Section In Truck Roll
    Attempt to enter alphabets at search No Of Days in Truck Roll Advanced Search
    Attempt to enter special characater at search No of Days in Truck Roll Advanced Search
    Input an integer from no of visits at search No of Visits in Truck Roll Advanced Search
     Click Search
    Verify No OF Days Search Result in Truck Roll When Search Using Integer
    [Teardown]      Close Browser

DWFM38_TC10
    [Documentation]     To verify Truck Roll "Create"  pop-up window look and feel

    Login to DWFM
    From Workforce Go To Truck Roll Section In Control Panel
    Click Create in Truck Roll
    Observe the create truck roll pop up window
    [Teardown]      Close Browser

DWFM38_TC11
    [Documentation]     To verify Truck Roll "Edit"  pop-up window look and feel

    Login to DWFM
    From Workforce Go To Truck Roll Section In Control Panel
    Click Edit truck roll in Truck Roll
    Observe the edit truck roll pop up window
     [Teardown]      Close Browser

DWFM38_TC12
    [Documentation]     To verify Truck Roll "Edit"  pop-up window look and feel

    Login to DWFM
    From Workforce Go To Truck Roll Section In Control Panel
    Click Create in Truck Roll
    At the Create Truck Roll pop-up window, erase data
    Click Cancel in Truck Roll Create
    Previous screen will be displayed
    At the Edit Truck Roll pop-up window, erase data
    Click Cancel in Truck Roll Edit
    Previous screen will be displayed
     [Teardown]      Close Browser

DWFM38_TC13
    [Documentation]     To verify "Reset" button is working as expected.

    Login to DWFM
    From Workforce Go To Truck Roll Section In Control Panel
    Click Create in Truck Roll
    Enter values for No of Days
    click Reset button in Truck Roll Create
    Value Reset to Zero in No of Days
    Enter values for No of Visits
    click Reset button in Truck Roll Create
    Value Reset to Zero in No of Visits
    Click Cancel in Truck Roll Create
    Create Truck Roll
    Click Edit truck roll in Truck Roll
    Click Reset button in Truck Roll Edit
    Values should remain as it is
    Click Edit truck roll in Truck Roll
    Enter values for No of Days in Truck Roll Edit
    Enter values for No of Visits in Truck Roll Edit
    Values Entered Successfully
    Click Reset button in Truck Roll Edit
    Values should remain as it is
    Click Cancel in Truck Roll Edit
    Previous screen will be displayed
     [Teardown]      Close Browser

DWFM38_TC14
    [Documentation]     To verify user can create Truck Roll record

    Login to DWFM
    From Workforce Go To Truck Roll Section In Control Panel
    Click Create in Truck Roll
    Enter values for No of Days
    Enter values for No of Visits
    Click Create Button In Create Truck Roll Pop Up
    Verify Successfully Created Record
    Click Close button at the notification message
    Verify Truck Roll listing page will be displayed
     [Teardown]      Close Browser

DWFM38_TC15
    [Documentation]     To verify user can edit Truck Roll record

    Login to DWFM
    From Workforce Go To Truck Roll Section In Control Panel
    Click Edit truck roll in Truck Roll
    At the Edit Truck Roll pop-up window, edit values for No of Days and or No of Visits
    Click Update button in Truck Roll Pop Up
    Verify Successfully Updated Record
    Click Close button at the notification message
    Verify Truck Roll listing page will be displayed After Editing
     [Teardown]      Close Browser

DWFM38_TC16
    [Documentation]     To verify user can delete Truck Roll record

     Login to DWFM
    From Workforce Go To Truck Roll Section In Control Panel
    Click Delete truck roll in Truck Roll
    Verify are you sure want to delete this
    Click Confirm at the notification message
    Verify Successfully Deleted Record
    Verify Record not displayed After Deleting
    Click Close button at the notification message
    Verify Record not displayed After Deleting
    [Teardown]      Close Browser

DWFM38_TC17
    [Documentation]     To verify user can create Truck Roll record with zero values

    Login to DWFM
    From Workforce Go To Truck Roll Section In Control Panel
    Click Create in Truck Roll
    Enter Zero values for No of Days
    Enter Zero values for No of Visits
    Click Create Button In Create Truck Roll Pop Up
    Verify Successfully Created Record
    Click Close button at the notification message
    Verify Truck Roll listing page will be displayed as Zero
    [Teardown]      Close Browser

DWFM38_TC18
    [Documentation]     To verify user can create Truck Roll record with zero values

    Login to DWFM
    From Workforce Go To Truck Roll Section In Control Panel
    Click Create in Truck Roll
    Enter Zero values for No of Visits
    Enter Zero values for No of Days
    Click Create Button In Create Truck Roll Pop Up
    Verify Successfully Created Record
    Click Close button at the notification message
    Verify Truck Roll listing page will be displayed
    Click Create in Truck Roll
    Enter values for No of Days
    Enter values for No of Visits
    Click Create Button In Create Truck Roll Pop Up
    Verify message truck roll with the same values is already exist
    [Teardown]      Close Browser

DWFM38_TC19
    [Documentation]     To verify user cannot edit Truck Roll record to existing values (duplicate)

    Login to DWFM
    From Workforce Go To Truck Roll Section In Control Panel
    Click Create in Truck Roll
    Enter Zero values for No of Visits
    Enter Zero values for No of Days
    Click Create Button In Create Truck Roll Pop Up
    Verify Successfully Created Record
    Click Close button at the notification message
    Verify Truck Roll listing page will be displayed
    Click Edit truck roll in Truck Roll
    Enter values for No of Days in Truck Roll Edit
    Enter values for No of Visits in Truck Roll Edit
    Values Entered Successfully
    Click Update Button In Truck Roll Pop Up
    Verify message truck roll with the same values is already exist
    Click Close button at the notification message
    Verify Truck Roll listing page will be displayed as Zero
    [Teardown]      Close Browser

DWFM38_TC20
    [Documentation]     To verify Clear button is working as expected

     Login to DWFM
    From Workforce Go To Truck Roll Section In Control Panel
    Go To Quick Search Tab Section in Truck Roll
    Input An Integer From No Of Days At Search Value
    Click Clear
    The no of days values entered should be cleared successfully
    Input an integer from no of visits at search Value
    The no of visits values entered should be cleared successfully
    Go To Advanced Search Tab Section In Truck Roll
     Input an integer from no of visits at search No of Visits in Truck Roll Advanced Search
     The no of visits in advanced search entered should be cleared successfully
     Input an integer from no of days at search No of Days in Truck Roll Advanced Search
     The no of days in advanced search entered should be cleared successfully
     At Advanced Search tab, enter values at both No of Days and No of Visits
     The no of days and visits in advanced search entered should be cleared successfully
      [Teardown]      Close Browser
















