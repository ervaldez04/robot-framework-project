### Note: arrange alhabetically ###
### Demo QA - Forms Module - Practice Forms Window ###

*** Variables ***
${STUDENT_CITY_OPTION}           //div[contains(@id,'react-select-4-option-') and contains(normalize-space(.),'city_')]
${STUDENT_DAY_OF_BIRTH_FIELD}    //div[not(contains(@class,'react-datepicker__day--outside-month')) and normalize-space(text())="day_of_birth"]
${STUDENT_HOBBIES_FIELD}         //label[contains(@for,'hobbies') and text()='hobbies_']
${STUDENT_RECORD_DATA}           //table//td[text()='label_name']/..//td[2]
${STUDENT_STATE_OPTION}          //div[contains(@id,'react-select-3-option-') and contains(normalize-space(.),'state_')]
${STUDENT_SUBJECTS_OPTION}       //div[@id='react-select-2-option-0' and contains(normalize-space(.),'subject_')]