*** Settings ***
Resource          ../../Generic_Resources/dwfm_resources.robot

*** Keywords ***
Scroll to Element
    [Arguments]    ${elementXpath3}
    [Documentation]    To input value to specific element in the page using xpath
    ...   Atikah Mohd Amin
    ...    28 Sept 2020
    Execute Javascript  document.evaluate("${elementXpath3}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(); window.scrollBy(0, 600);

Click Element By Xpath
    [Arguments]    ${elementXpath2}
    [Documentation]    To click specific element in the page using xpath
    ...   Atikah Mohd Amin
    ...    23 Oct 2020
    Execute Javascript    document.evaluate("${elementXpath2}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();

Input Text in Textfield
    [Arguments]     ${textFieldName}       ${textfieldData}
    [Documentation]    To input value in Textfield Based on Textfiled Name
    ...     Atikah Mohd Amin
    ...     30 Sept 2020

    Input Text      //label//span[contains(., "${textFieldName}")]/ancestor::div[contains(@class, 'default-label')]/following-sibling::div[@class='input-group']//input	        ${textfieldData}

Choose Value from Drop Down List
     [Arguments]     ${dropDownListLabel}       ${listData}
    [Documentation]    To select value in Dropdown List Based on DropDown List Label Name
    ...     Atikah Mohd Amin
    ...     30 Sept 2020

    Click Element   //label//span[contains(., "${dropDownListLabel}")]/ancestor::div[contains(@class, 'default-label')]/following-sibling::div[@class='input-group']//a[@role='button']
    Wait Until Element Is Visible       //div[contains(@class, 'select-dropdown-list show')]        ${visibilityTimeOut}
    Capture Page Screenshot
    Click Element By Xpath      (//a[contains(@class, 'select-dropdown-item') and contains(., '${listData}')])[1]
    Wait Until Element Is Visible       //label//span[text()="${dropDownListLabel}"]/ancestor::div[contains(@class, 'default-label')]/following-sibling::div[@class='input-group']//a[@role='button']//div[contains(., "${listData}")]       ${visibilityTimeOut}

Clear Dropdown List Value
     [Arguments]     ${dropDownListLabel2}
    [Documentation]    To clear value in Dropdown List Based on DropDown List Label Name
    ...     Atikah Mohd Amin
    ...     30 Sept 2020

    Click Element   //label//span[text()="${dropDownListLabel2}"]/ancestor::div[contains(@class, 'default-label')]/following-sibling::div[@class='input-group']//a[@role='button']/following-sibling::a[contains(@class, 'select-clear-icon')]

Choose Value From Drop Down List 2
    [Arguments]     ${dropDownListLabel3}   ${listData2}
    [Documentation]    To select value in Dropdown List Based on DropDown List Label Name Version 2
    ...     Atikah Mohd Amin
    ...     30 Sept 2020
    Click Element   //label[contains(., "${dropDownListLabel3}")]/..//div[@class='input-group']//a[@role='button']
    Wait Until Element Is Visible   //div[contains(@class, 'select-dropdown-list show')]    ${visibilityTimeOut}
    Click Element By Xpath   (//a[contains(@class, 'select-dropdown-item') and contains(., '${listData2}')])[1]
    Wait Until Element Is Visible   //label[contains(., "${dropDownListLabel3}")]/..//div[@class='input-group']//a[@role='button']//div[contains(., "${listData2}")]  ${visibilityTimeOut}   ${visibilityTimeOut}

Clear Field 2
    [Arguments]     ${dropDownListLabel4}
    [Documentation]    To clear value in Dropdown List Based on DropDown List Label Name Version 2
    ...     Atikah Mohd Amin
    ...     30 Sept 2020
    Click Element   //label[contains(., "${dropDownListLabel4}")]/..//div[@class='input-group']//a[@role='button']/following-sibling::a[contains(@class, 'select-clear-icon')]

Select Tab
    [Arguments]     ${tabLabel}
    [Documentation]    Select Tab in Page
    ...     Atikah Mohd Amin
    ...     30 Sept 2020
	Click Element   //div[contains(@class, 'tab-fillup')]//span[contains(., "${tabLabel}")]
	Wait Until Element Is Visible   //div[contains(@class, 'tab-fillup')]//a[contains(@class, 'active')]//span[contains(., "${tabLabel}")]      ${visibilityTimeOut}

Click Button
    [Arguments]     ${buttonLabel}
    [Documentation]    Click Button in Page
    ...     Atikah Mohd Amin
    ...     30 Sept 2020
    Wait Until Element Is Visible   //button[contains(., "${buttonLabel}")]      ${visibilityTimeOut}
    Click Element       //button[contains(., "${buttonLabel}")]

Input Text in Filter
    [Arguments]     ${cardHeader}   ${filterData}
    [Documentation]    Input Data in Filter
    ...     Atikah Mohd Amin
    ...     30 Sept 2020
   Scroll to Element     //h5[contains(., '${cardHeader}')]/ancestor::div[contains(@class, 'card-header')]/following-sibling::div[contains(@class, 'card-body')]//div[contains(@class, 'toolsbar')]/input[@placeholder='Type to filter']
   Input Text           //h5[contains(., '${cardHeader}')]/ancestor::div[contains(@class, 'card-header')]/following-sibling::div[contains(@class, 'card-body')]//div[contains(@class, 'toolsbar')]/input[@placeholder='Type to filter']         ${filterData}
    Sleep   1s

Click Create
    [Arguments]     ${cardHeader2}      ${sectionName}
    [Documentation]    Click Create in Card
    ...     Atikah Mohd Amin
    ...     30 Sept 2020
    Scroll to Element   //crmx-card[contains(., '${cardHeader2}')]/../following-sibling::crmx-card//h5[contains(., '${sectionName}')]/ancestor::div[contains(@class, 'card-header')]/following-sibling::div[contains(@class, 'card-body')]//crmx-icon-link//button[contains(., 'Create')]
	Click Element       //crmx-card[contains(., '${cardHeader2}')]/../following-sibling::crmx-card//h5[contains(., '${sectionName}')]/ancestor::div[contains(@class, 'card-header')]/following-sibling::div[contains(@class, 'card-body')]//crmx-icon-link//button[contains(., 'Create')]

Click Create 2
    [Arguments]     ${cardHeader2}      ${sectionName}
    [Documentation]    Click Create in Card in Control Panel>Resource Management>Building Restriction
    ...                 Click Create Work Order
    ...     Atikah Mohd Amin
    ...     21 Oct 2020
    Scroll To Element       //crmx-card[contains(., '${cardHeader2}')]/../../following-sibling::crmx-card//h5[contains(., '${sectionName}')]/ancestor::div[contains(@class, 'card-header')]/following-sibling::div[contains(@class, 'card-body')]//button//span/span[contains(., 'Create')]
    Click Element           //crmx-card[contains(., '${cardHeader2}')]/../../following-sibling::crmx-card//h5[contains(., '${sectionName}')]/ancestor::div[contains(@class, 'card-header')]/following-sibling::div[contains(@class, 'card-body')]//button//span/span[contains(., 'Create')]

Click Create in Jeopardy Configuration
    [Documentation]    Click Create in Card in Control Panel>Work Management>Jeopardy Configuration
    ...     Atikah Mohd Amin
    ...     21 Oct 2020
    Scroll To Element       //crmx-card[contains(., 'Work Categories')]/following-sibling::crmx-card//h6[contains(., 'Order Configuration')]/ancestor::div[contains(@class, 'card-content')]//crmx-icon-link//button[contains(., 'Create')]
    Click Element           //crmx-card[contains(., 'Work Categories')]/following-sibling::crmx-card//h6[contains(., 'Order Configuration')]/ancestor::div[contains(@class, 'card-content')]//crmx-icon-link//button[contains(., 'Create')]

Click Create in Network Details
    [Documentation]    Click Create in Card in Control Panel>Work Management>Network Details
    ...     Atikah Mohd Amin
    ...     21 Oct 2020
    Scroll To Element       //h5[contains(., 'Network Details')]/ancestor::div[contains(@class, 'card-header')]/following-sibling::div[contains(@class, 'card-body')]//crmx-icon-link//button[contains(., 'Create')]
    Click Element           //h5[contains(., 'Network Details')]/ancestor::div[contains(@class, 'card-header')]/following-sibling::div[contains(@class, 'card-body')]//crmx-icon-link//button[contains(., 'Create')]

Click Export
    [Arguments]     ${cardHeader3}      ${sectionName2}
    [Documentation]    Click Create in Card
    ...     Atikah Mohd Amin
    ...     30 Sept 2020
    Scroll to Element   //crmx-card[contains(., '${cardHeader3}')]//h5[contains(., '${sectionName2}')]/ancestor::div[contains(@class, 'card-header')]/following-sibling::div[contains(@class, 'card-body')]//button[contains(., 'Export')]
	Click Element       //crmx-card[contains(., "${cardHeader3}")]//h5[contains(., "${sectionName2}")]/ancestor::div[contains(@class, 'card-header')]/following-sibling::div[contains(@class, 'card-body')]//button[contains(., 'Export')]


Access Sub Menu From Workforce
    [Arguments]     ${subMenu}      ${subSubLevel}
    [Documentation]    Access Sub Menu From Workforce Main Menu
    ...     Atikah Mohd Amin
    ...     01 October 2020
   Click Element        ${WORKFORCE_DDL}
   Wait Until Element Is Visible        //div[contains(@class, 'sub-menu-header')]//a/span[contains(., "${subMenu}")]      30s
   Scroll to Element    //nav[contains(@class, 'sub-level')]//a/span[contains(., '${subSubLevel}')]
   Capture Page Screenshot
   Click Element        //nav[contains(@class, 'sub-level')]//a/span[contains(., "${subSubLevel}")]
   Page Finished Loading


Choose option in Control Panel
    [Arguments]     ${optionInControlPanel}
    [Documentation]    Access Sub Menu From Workforce Main Menu
    ...     Atikah Mohd Amin
    ...     01 October 2020
    Scroll To Element   //datatable-body-cell//span[contains(., '${optionInControlPanel}')]
    Wait Until element Is Visible       //datatable-body-cell//span[contains(., "${optionInControlPanel}")]     ${visibilityTimeOut}
    Click Element       //datatable-body-cell//span[contains(., "${optionInControlPanel}")]
    Page Finished Loading
    Wait Until Element Is Visible       //h5[contains(., "${optionInControlPanel}")]  30s
    Capture Page Screenshot

Verify Search Result
    [Arguments]     ${column_no}        ${searchResultData}
    [Documentation]    Verify Data in Search Result Table
    ...     Atikah Mohd Amin
    ...     02 October 2020
    Scroll To Element       ${SEARCH_RESULTS_HEADER}
    Page Should Contain Element     (//datatable-body-cell)'${column_no}'//crmx-status-badge[contains(., '${searchResultData}')]
    Capture Page Screenshot

Verify Textfield Is Mandatory
   [Arguments]     ${textfieldLabel}
    [Documentation]    Verify Textfield Is Mandatory To Fill
    ...     Atikah Mohd Amin
    ...     02 October 2020

    Page Should Contain Element     //label[contains(@class, 'show-required')]/span[contains(., '${textfieldLabel}')]/ancestor::div[contains(@class, 'default-label')]/following-sibling::div[@class='input-group']//input

Clear Text Field
   [Arguments]     ${textfieldLabel2}
    [Documentation]    Clear Textfield Based ON Textfield Label Name
    ...     Atikah Mohd Amin
    ...     02 October 2020

    Clear Element Text    //label[contains(@class, 'show-required')]/span[contains(., '${textfieldLabel2}')]/ancestor::div[contains(@class, 'default-label')]/following-sibling::div[@class='input-group']//input

Verify Record Is Deleted in Search Result
    [Arguments]     ${column_no}        ${searchResultData}
    [Documentation]    Verify Data Not Visible in Search Result Table After Deletion
    ...     Atikah Mohd Amin
    ...     02 October 2020
    Scroll To Element       ${SEARCH_RESULTS_HEADER}
    Page Should Not Contain Element     (//datatable-body-cell)["${column_no}"]//span[contains(@class, 'datatable-cell-text') and contains(., "${searchResultData}")]
    Capture Page Screenshot

Verify Record Is Not Created in Search Result
    [Arguments]     ${column_no}        ${searchResultData}
    [Documentation]    Verify Data Not Visible in Search Result Table After Deletion
    ...     Atikah Mohd Amin
    ...     02 October 2020
    Scroll To Element       ${SEARCH_RESULTS_HEADER}
    Page Should Not Contain Element     (//datatable-body-cell)["${column_no}"]//span[contains(@class, 'datatable-cell-text') and contains(., "${searchResultData}")]
    Capture Page Screenshot

Verify Data Cleared
    [Arguments]     ${textfieldLabel3}       ${dataEntered}
    [Documentation]    Verify Data Cleared and Not visible after Click Clear Button
    ...     Atikah Mohd Amin
    ...     02 October 2020

    Page Should Not Contain Element    //label//span[contains(., '${textfieldLabel3}')]/ancestor::div[contains(@class, 'default-label')]/following-sibling::div[@class='input-group']//input[contains(@ng-reflect-model, '${dataEntered}')]
    Capture Page Screenshot

Choose Option in Checkbox
    [Arguments]     ${checkboxLabel}
    [Documentation]    Choose option in checkbox based on checkbox label
    ...     Atikah Mohd Amin
    ...     06 October 2020
    select checkbox     //label[contains(., '${checkboxLabel}')]/preceding-sibling::input[@type='checkbox']

Unchoose Option in Checkbox
    [Arguments]     ${checkboxLabel1}
    [Documentation]    Choose option in checkbox based on checkbox label
    ...     Atikah Mohd Amin
    ...     06 October 2020
    unselect checkbox       //label[contains(., '${checkboxLabel1}')]/preceding-sibling::input[@type='checkbox']

Verify Checkbox Is Unchecked
    [Arguments]     ${checkboxLabel2}
    [Documentation]    Verify checkbox is successfully unchecked
    ...     Atikah Mohd Amin
    ...     06 October 2020
    Wait Until Page Contains Element    //label[contains(., '${checkboxLabel2}')]/preceding-sibling::input[@type='checkbox' and contains (@ng-reflect-model, 'false')]      ${visibilityTimeOut}

Verify Checkbox Is Checked
    [Arguments]     ${checkboxLabel3}
    [Documentation]    Verify checkbox is successfully checked
    ...     Atikah Mohd Amin
    ...     06 October 2020
    Page Should Contain Element    //label[contains(., '${checkboxLabel3}')]/preceding-sibling::input[@type='checkbox' and contains (@ng-reflect-model, 'true')]        ${visibilityTimeOut}

Input Text In Textfield For Popup Window
       [Arguments]    ${fieldName}      ${inputData}
    [Documentation]    Input data in textfield which resides in popup window
    ...     Atikah Mohd Amin
    ...     21 October 2020
    Input Text		//crmx-modal/div[contains(@class, 'show')]//crmx-form-input[@ng-reflect-label='${fieldName}']//input			${inputData}

Select Value From Dropdown List For Popup Window
       [Arguments]    ${fieldName}      ${listData}
    [Documentation]    Select value in drop down list which resides in popup window
    ...     Atikah Mohd Amin
    ...     21 October 2020
    Click Element	//crmx-modal/div[contains(@class, 'show')]//label//span[text()="${fieldName}"]/ancestor::div[contains(@class, 'default-label')]/following-sibling::div[@class='input-group']//a[@role='button']
    Wait Until Element Is Visible 				//crmx-modal/div[contains(@class, 'show')]//div[contains(@class, 'select-dropdown-list show')]		${visibilityTimeout}
    Capture Page Screenshot
    Wait Until Element Is Visible    //crmx-modal/div[contains(@class, 'show')]//div[contains(@class, 'select-dropdown-list') and contains(@class, 'show')]/a[contains(@class, 'select-dropdown-item') and contains(., "${listData}")]          ${visibilityTimeOut}
    Click Element	    //crmx-modal/div[contains(@class, 'show')]//div[contains(@class, 'select-dropdown-list') and contains(@class, 'show')]/a[contains(@class, 'select-dropdown-item') and contains(., "${listData}")]
    Wait Until Element Is Visible 	    //crmx-modal/div[contains(@class, 'show')]//label//span[text()="${fieldName}"]/ancestor::div[contains(@class, 'default-label')]/following-sibling::div[@class='input-group']//a[@role='button']//div[contains(., "${listData}")] 	${visibilityTimeout}
    Capture Page Screenshot

Clear Textfield For Popup Window
       [Arguments]    ${fieldName}
    [Documentation]    Clear textfield which resides in popup window
    ...     Atikah Mohd Amin
    ...     21 October 2020
    Clear Element Text    		//crmx-modal/div[contains(@class, 'show')]//crmx-form-input[@ng-reflect-label='${fieldName}']//input

Access Sub Menu From Administration
    [Arguments]     ${subMenu}      ${subSubLevel}
    [Documentation]    Access Sub Menu From Administration` Main Menu
    ...     Atikah Mohd Amin
    ...     23 October 2020
   Click Element        ${ADMIN_DDL}
   Wait Until Element Is Visible        //div[contains(@class, 'sub-menu-header')]//a/span[contains(., "${subMenu}")]      30s
   Scroll to Element    //nav[contains(@class, 'sub-level')]//a/span[contains(., '${subSubLevel}')]
   Capture Page Screenshot
   Click Element        //nav[contains(@class, 'sub-level')]//a/span[contains(., "${subSubLevel}")]
   Page Finished Loading

Choose Option In Radio Button
    [Arguments]     ${radioButtonLabel}      ${RadioBtnValue}
    [Documentation]    Click Value in Radio Button
    ...     Atikah Mohd Amin
    ...     23 October 2020
  Scroll To Element    //p[contains(., '${radioButtonLabel}')]/ancestor::formly-field/following-sibling::formly-field//label[text()='${RadioBtnValue}']/preceding-sibling::input[@type='radio']
  Click Element        //p[contains(., '${radioButtonLabel}')]/ancestor::formly-field/following-sibling::formly-field//label[text()='${RadioBtnValue}']/preceding-sibling::input[@type='radio']

Select Country Code in Phone No in Combobox
    [Arguments]     ${comboBoxLabel}      ${countryName}
    [Documentation]    Select country code for phone number field in combobox
    ...     Atikah Mohd Amin
    ...     23 October 2020
    Click Element    //label//span[contains(., '${comboBoxLabel}')]/ancestor::crmx-form-label/following-sibling::div[@class='input-group']//div[@role='combobox']
    Wait Until Element Is Visible       //*[@id="country-listbox"]      ${visibilityTimeOut}
    Click Element By Xpath    //li[contains(@id, 'iti-item')]//span[contains(@class, 'country-name') and contains(., '${countryName}')]

Input Text In Textfield in Advanced Search
    [Arguments]     ${textfieldLabel}      ${textData}
    [Documentation]    Input text in textfield for advanced search tab
    ...     Atikah Mohd Amin
    ...     27 October 2020

    Input Text          //label[contains(., "${textfieldLabel}")]/..//div[@class='input-group']//input      ${textData}






