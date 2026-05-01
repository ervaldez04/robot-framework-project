*** Settings ***

### Keywords ###
Resource    ../ImportGenericFile/GenericFile.robot

### Variables ###
Variables    ../../Variables/DemoQaVariables.py

### Locators - Dynamic ###
Resource    ../../Locators/Dynamic/DemoQA/ElementsModule/WebTables.robot

### Locators - Static ###
Resource    ../../Locators/Static/DemoQA/ElementsModule/Buttons.robot
Resource    ../../Locators/Static/DemoQA/ElementsModule/CheckBox.robot
Resource    ../../Locators/Static/DemoQA/ElementsModule/Links.robot
Resource    ../../Locators/Static/DemoQA/ElementsModule/RadioButton.robot
Resource    ../../Locators/Static/DemoQA/ElementsModule/TextBox.robot
Resource    ../../Locators/Static/DemoQA/ElementsModule/WebTables.robot