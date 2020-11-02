*** Settings ***
Documentation     DWFM-45: Work Order Management
...               06 October 2020
...               Atikah Mohd Amin
Resource          Keywords.robot

*** Test Cases ***

DWFM45_TC1
    [Documentation]    To verify that the user can create a work order with one task (no service work) into an appointment.
    ...                 To verify that after work order is created, user can view the new work order with the related task.
     ...                The work order status should be reserved.

    Login to DWFM
    Click At Work Order Under Work Force
    Click Create in Work Order
    Enter data for all input fields in the Create Work Order page
    At the Task section, untick the Automatically Create Service Work check box
    At the Task section, click Add Task hyperlink
    Enter data for all input fields and click Submit to create a task
    At the Appoinment section, click the Calendar button
    Select or Book an Appointment schedule or timeslot and click Submit button
    Verify Appoinmtent schedule or timeslot is booked successful
    Enter Priority for the appointment (optional)
    Click Submit button to create the work order
    Verify Work Order After Submitted
    At the Work Order, go to the listing table and observe the newly created work order
    At the Action column, click Details hyperlink

    [Teardown]      Close Browser

DWFM45_TC2
    [Documentation]    - To verify that the user can create a work order with one task and a service work into an appointment.
    ...                 To verify that after work order is created, user can view the new work order with the related task and appointment.
    ...                  The work order status should be reserved.

    Login to DWFM
    Click At Work Order Under Work Force
    Click Create in Work Order
    Enter data for all input fields in the Create Work Order page
    At the Task section, untick the Automatically Create Service Work check box
    At the Task section, click Add Task hyperlink
    Enter data for all input fields and click Submit to create a task
    At the Appoinment section, click the Calendar button
    Select or Book an Appointment schedule or timeslot and click Submit button
    Verify Appoinmtent schedule or timeslot is booked successful
    Enter Priority for the appointment (optional)
    Click Submit button to create the work order
    Verify Work Order After Submitted
    At the Work Order, go to the listing table and observe the newly created work order
    At the Action column, click Details hyperlink

    [Teardown]      Close Browser

DWFM45_TC3
    [Documentation]    - To verify that the user can create a work order with multiple tasks and a service work into an appointment.
    ...                  To verify that after work order is created, user can view the new work order with the related task and appointment.
    ...                 The work order status should be reserved.

    Login to DWFM
    Click At Work Order Under Work Force
    Click Create in Work Order
    Enter data for all input fields in the Create Work Order page
    At the Task section, untick the Automatically Create Service Work check box
    At the Task section, click Add Task hyperlink
    Enter data for all input fields and click Submit to create a task
    At the Task section, click Add Task hyperlink
    Enter data for all input fields and click Submit to create a task2
    At the Appoinment section, click the Calendar button
    Select or Book an Appointment schedule or timeslot and click Submit button
    Verify Appoinmtent schedule or timeslot is booked successful
    Enter Priority for the appointment (optional)
    Click Submit button to create the work order
    Verify Work Order After Submitted
    At the Work Order, go to the listing table and observe the newly created work order
    At the Action column, click Details hyperlink

    [Teardown]      Close Browser
