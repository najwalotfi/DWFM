*** Settings ***
Documentation     DWFM 1: As a user I want to able click Control Panel ->
...               Batch Management so that i can access Control Panel -> Batch Management Pages
...               21 September 2020
...               Atikah Mohd Amin
Resource          Keywords.robot

*** Test Cases ***

DWFM1_TC1
    [Documentation]   To verify the look and feel of Batch Management landing page follows the specifications and standards

    Login to DWFM
    Access Batch Details From Control Panel

    [Teardown]      Close Browser

