*** Settings ***
Documentation    Suite description
Library     Selenium2Library

*** Test Cases ***
Open chrome
    [Tags]    chrome
    open browser     http://www.baidu.com     chrome
    Sleep    10
    close browser

*** Keywords ***
Provided precondition
    Setup system under test
