*** Variables ***
${MA_DAY}       28
${MA_DAY2}      30
${CHANGED_DATE_DATA}        28-Oct-2020
${ASSMNT_GROUP_CHANGED_DATA}        AG002
${TECHNICIAN_NAME_DATA}     Mariah Carey
#---#
${MANUAL_ASSIGNMENT_HEADER}        //h5[contains(., 'Manual Assignment')]
${MA_ROSTER}        //*[@id="timelineContainer"]
${TIMESLOT1}        (//div[@class='vis-group'])[1]
${TIMESLOT2}        (//div[@class='vis-group'])[2]
${TASK_MANUAL_ASSIGNMENT}       //div[contains(@class, 'work-item-bar')]
${MA_CALENDAR_BTN}      //crmx-datepicker//button/i[contains(@class, 'icon-calendar2')]
${CALENDAR_MONTH_DLL}   //select[contains(@title, 'Select month')]
${MA_DAY_DATA}       //div[contains(@class, 'custom-day') and contains(., '${MA_DAY}')][not(contains(@class, 'text-muted'))]
${MA_CHANGE_DAY_DATA}    //div[contains(@class, 'custom-day') and contains(., '${MA_DAY2}')][not(contains(@class, 'text-muted'))]
${MA_ALL_TASK}      //button[contains(@class, 'filter-button') and contains(., 'All')]
${MA_TASK1}         //div[contains(@class, 'work-item-bar')][1]
${EARLIEST_TASK}     //div[contains(@class, 'vis-item') and contains(@class, 'status')]
${LATEST_TASK}      //div[contains(@class, 'vis-item') and contains(@class, 'status')][2]
${PENDING_TASK1}    //div[contains(@class, 'work-item')]//div[contains(@class, 'status-pending')]
${CALENDAR_DROP_TARGET1}        //div[contains(@class,'vis-itemset')]//div[contains(@class, 'vis-group')]
${ASSMNT_VALIDATION_MSG}        //div[contains(@class, 'modal-header') and contains(., 'Assignment Validation')]
${MA_OVERRIDE_BTN}              //button[contains(., 'Override')]
${TASK_ASSIGNED_IN_ROSTER}      //div[contains(@class, 'vis-item') and contains(@class, 'status-pending')]
${TASK_NO_IN_ROSTER}            //div[contains(@class, 'vis-item') and contains(@class, 'item-content')]
${TASK_ASSIGNED_IN_TASK_LIST}   //div[contains(@class, 'work-item')]//div[contains(., 'Assigned')]
${CHANGED_DATE}                  //input[contains(@class, 'formattedDate') and contains(@ng-reflect-model, '${CHANGED_DATE_DATA}')]
${CHANGED_ASSIGNMENT_GROUP}     //div[contains(@class, 'select-value') and contains(., '${ASSMNT_GROUP_CHANGED_DATA}')]
${WORK_DETAILS_POPUP}           //div[@class='modal-body']//crmx-dwfm-ma-work-detail
${MORE_DETAILS_BTN}             //button[contains(., 'More Detail')]
