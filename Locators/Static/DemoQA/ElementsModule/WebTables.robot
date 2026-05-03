### Note: arrange alhabetically ###
### Demo QA - Elements Module - Web Tables Window ###

*** Variables ***
${ADD_BUTTON}            //button[@id='addNewRecordButton']
${AGE_FIELD}             //input[@id='age']
${DELETE_ICON}           //span[contains(@id,'delete-record')]
${DEPARTMENT_FIELD}      //input[@id='department']
${EDIT_ICON}             //span[contains(@id, 'edit-record')]
${EMAIL_FIELD}           //input[@id='userEmail']_
${FIRST_BUTTON}          //button[normalize-space()='First']
${FIRST_NAME_FIELD}      //input[@id='firstName']
${LAST_BUTTON}           //button[normalize-space()='First']
${LAST_NAME_FIELD}       //input[@id='lastName']
${NEXT_BUTTON}           //button[normalize-space()='First']
${PAGE_SECTION}          //*[@class='col-auto']/strong
${PREVIOUS_BUTTON}       //button[normalize-space()='First']
${REGISTRATION_MODAL}    //*[@class='modal-content']
${SALARY_FIELD}          //input[@id='salary']
${SEARCH_FIELD}          //input[@id='searchBox']
${SUBMIT_BUTTON}         //button[@id='submit']
${TABLE}                 //table[contains(@class, 'table-striped')]
${TABLE_BODY}            ${TABLE}//tbody
${TABLE_BODY_ROW}        ${TABLE_BODY}/tr
${TABLE_HEADER}          ${TABLE}//tr/th
${X_BUTTON}              //button[@class='btn-close']
