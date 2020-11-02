*** Variables ***
${SEARCH_RESULT_HEADER}     //h5[contains(., 'Search Results')]
${ADMIN_DDL}        //a//span[contains(., 'Administration')]
${CREATE_USER_HEADER}       //h5[contains(., 'Create User')]
${PHONE_NO_COMBOBOX}       //label//span[contains(., 'Contact Number')]/ancestor::crmx-form-label/following-sibling::div[@class='input-group']//input[contains(@class, 'phoneNum')]
${OWNER_DDL}               //*[@id='formly_34_select_partySelect_0']
${SUCCESSFULLY_CREATED_USER}       //div[contains(@class, 'prompt-success')]//div[contains(@class, 'msg') and contains(., 'User created successfully')]
${SUCCESSFULLY_CREATED_USER_CLOSE_BTN}      //div[contains(@class, 'prompt-success')]//button[contains(., 'Close')]
${KC_ADMINISTRATION_CONSOLE}       //a[contains(., 'Administration Console')]
${KC_LOGIN_PAGE}        //*[@id="kc-page-title"]
${KC_USERNAME_TEXTFIELD}    //input[@id="username"]
${KC_PASSWORD_TEXTFIELD}    //input[@id="password"]
${KC_LOGIN_BTN}             //*[@id="kc-login"]
${KC_LOGO}                  //div[contains(@class, 'navbar-header')]//a
${KC_REALM_CUSTOMER}        //div[@id="view"]//a[contains(., 'starhub')]
${KC_STARHUB_DROP_DOWN}    //div[@id="view"]//h2[contains(., 'Starhub')]
${KC_USERS}                 //h2[contains(., 'Manage')]/..//li/a[contains(., 'Users')]
${USERS_HEADER}             //div[@id="view"]//h1[contains(., 'Users')]
${USERS_SEARCH_TEXTFIELD}   //*[@id="user-table"]//input
${USERS_SEARCH_BTN}         //*[@id="userSearch"]
##--Company Profile-->
${SEARCH_RESULT_TABLE}      //*[@id="user-table"]//td[contains(@class, 'clip')]
${COMPANY_PROFILE_TABLE_CONTENT}    //datatable-body-cell//span
${COMPANY_EDIT_BTN}         //button//span/span[contains(., 'Edit')]
${COMPANY_DELETE_BTN}       //button//span/span[contains(., 'Delete')]
${UPDATE_COMPANY_PROFILE_HEADER}        //h5[contains(., 'Update Company Profile')]

