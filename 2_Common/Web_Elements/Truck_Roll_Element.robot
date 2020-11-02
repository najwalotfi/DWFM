*** Variables ***
${TRUCK_ROLL_COLUMN}        //datatable-body-cell//span[contains(., 'Truck Roll')]
${TRUCK_ROLL_LISTING}       //crmx-dwfm-search-panel[contains(., 'Truck Roll Search')]/following-sibling::crmx-card[contains(., 'Search Results')]
${ADVANCED_SEARCH_TAB}      //div[contains(@class, 'tab-fillup')]//span[contains(., 'Advanced Search')]
${SEARCH_BY_DDL}         //label//span[text()="Search By"]/ancestor::div[contains(@class, 'default-label')]/following-sibling::div[@class='input-group']//a[@role='button']
${NO_OF_DAYS_SELECTION}     (//a[contains(@class, 'select-dropdown-item') and contains(., "No. of Days")])[1]
${NO_OF_VISITS_SELECTION}     (//a[contains(@class, 'select-dropdown-item') and contains(., " No. of Visits")])[1]
${NO_OF_DAYS_SEARCH_RESULT_TEXT1}       (//datatable-body-cell)[1]//span[contains(@class, 'datatable-cell-text')]
${NO_OF_VISITS_SEARCH_RESULT_TEXT1}     (//datatable-body-cell)[2]//span[contains(@class, 'datatable-cell-text')]
${SEARCH_RESULTS_HEADER}        //h5[contains(@class, 'card-title') and contains(., 'Search Results')]
${ADVANCED_SEARCH_NO_OF_DAYS_TEXTFIELD}     //label//span[contains(., "No. of Days:")]/ancestor::div[contains(@class, 'default-label')]/following-sibling::div[@class='input-group']//input
${ADVANCED_SEARCH_NO_OF_VISITS_TEXTFIELD}     //label//span[contains(., "No. of Visits:")]/ancestor::div[contains(@class, 'default-label')]/following-sibling::div[@class='input-group']//input
${CREATE_TRUCK_ROLL_POPUP_HEADER}             //div[contains(@class,  'modal-header')]/div[contains(., 'Create Truck Roll')]
${CREATE_TRUCK_ROLL_POPUP_CREATE_BTN}         //div[contains(@class,  'modal-header')]/div[contains(., 'Create Truck Roll')]/../following-sibling::div[@class='modal-body']//button[contains(., 'Create')]
${CREATE_TRUCK_ROLL_POPUP_RESET_BTN}          //div[contains(@class,  'modal-header')]/div[contains(., 'Create Truck Roll')]/../following-sibling::div[@class='modal-body']//button[contains(., 'Cancel')]
${CREATE_TRUCK_ROLL_POPUP_CANCEL_BTN}         //div[contains(@class,  'modal-header')]/div[contains(., 'Create Truck Roll')]/../following-sibling::div[@class='modal-body']//button[contains(., 'Reset')]
${EDIT_TRUCK_ROLL_POPUP_HEADER}                //div[contains(@class,  'modal-header')]/div[contains(., 'Edit Truck Roll')]
${EDIT_TRUCK_ROLL_POPUP_UPDATE_BTN}            //div[contains(@class,  'modal-header')]/div[contains(., 'Edit Truck Roll')]/../following-sibling::div[@class='modal-body']//button[contains(., 'Update')]
${EDIT_TRUCK_ROLL_POPUP_CANCEL_BTN}             //div[contains(@class,  'modal-header')]/div[contains(., 'Edit Truck Roll')]/../following-sibling::div[@class='modal-body']//button[contains(., 'Cancel')]
${EDIT_TRUCK_ROLL_POPUP_RESET_BTN}              //div[contains(@class,  'modal-header')]/div[contains(., 'Edit Truck Roll')]/../following-sibling::div[@class='modal-body']//button[contains(., 'Reset')]
${INVALID_FBACK_THIS_FIELD_IS_REQUIRED}         //div[contains(@class, 'invalid-feedback')]/span[contains(., ' This field is required ')]
${DATA_SUCCESSFULLY_CREATED_MSG}                //div[contains(@class, 'modal-body-msg') and contains(., 'The data was successfully created.')]
${DATA_SUCCESSFULLY_UPDATED_MSG}                //div[contains(@class, 'modal-body-msg') and contains(., 'The data was successfully updated.')]
${DATA_SUCCESSFULLY_DELETED_MSG}                //div[contains(@class, 'modal-body-msg') and contains(., 'The data was successfully deleted.')]
${ARE_U_SURE_DELETE_THIS_MSG}                   //div[contains(@class, 'modal-body-msg') and contains(., 'Are you sure you want to delete this')]
${DELETE_CONFIRM_BTN}                           //*[@id="confirmYesButton"]
${SAME_VALUE_ALREADY_EXIST_MSG}                     //div[contains(@class, 'modal-body-msg') and contains(., ' truck roll with the same values is already exist')]
${TRUCK_ROLL_UNDER_NETWORK_DETAIL}              //datatable-body-cell//span[contains(., 'Truck Roll')]/ancestor::datatable-row-wrapper/preceding-sibling::datatable-row-wrapper//datatable-body-cell//span[contains(., 'Network Detail')]