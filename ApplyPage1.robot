*** Settings ***
Resource          ResourceData.txt
Library           Selenium2Library
Resource          ErrorValidation.txt

*** Variables ***

*** Test Cases ***
TC0001-Validating FirstName And Last Name With Special and Alpha Character
    [Tags]    TC0001
    InvokeBrowser
    Input Text    id_firstname    ${FirstNameWithSplAlpha}
    Press Key    id_firstname    \\09
    ${FirstErrorName}    Get Text    id_firstname_error
    Should Be Equal As Strings    ${FirstErrorName}    @{expectedFirstNameErrorMessage}[0]
    Input Text    id_lastname    ${LastNameWithSpeciaAlpha}
    Press Key    id_lastname    \\09
    ${LastErrorName}    Get Text    id_lastname_error
    Should Be Equal As Strings    ${LastErrorName}    @{expectedLastNameErrorMessage}[0]
    [Teardown]    Close All Browsers

TC0002-Verify DataofBirth fields are selected are Per the user Input
    [Tags]    TC0002
    InvokeBrowser
    Input Text    exampleDate    15/08/2015
    [Teardown]    Close All Browsers

TC0003-Verify Application Throwing Error when customer entered invalid Format Mobile Number
    [Tags]    TC0003
    InvokeBrowser
    Input Text    id_mobile_number    ${invalidMobileNum}
    Press Key    id_mobile_number    \\09
    Wait Until Keyword Succeeds    20s    5s    Wait Until Element Is Visible    id_mobile_number_error    10s
    ${ActualMobileNumError}    Get Text    id_mobile_number_error
    Should Be Equal As Strings    ${ActualMobileNumError}    @{expectedMobileNumberErrorMessage}[1]
    Log To Console    Validating Optional Phone Number field is Throwing Error Message
    Input Text    id_home_number    ${invalidMobileNum}
    Press Key    id_home_number    \\09
    Wait Until Keyword Succeeds    20s    5s    Wait Until Element Is Visible    //input[@id='id_home_number']/following-sibling::span    10s
    ${ActualHomeNumError}    Get Text    //input[@id='id_home_number']/following-sibling::span
    Should Be Equal As Strings    ${ActualHomeNumError}    @{expectedHomeNumberErrorMessage}[0]
    Log To Console    Test case is Executed for validating invalid Phone number
    [Teardown]    Close All Browsers

TC0004-Verify Application Throwing error when invalid Postal Code is entered
    [Tags]    TC0004
    InvokeBrowser
    Input Text    id_postcode    ${InvalidPostalCode}
    Press Key    id_postcode    \\09
    Wait Until Keyword Succeeds    20s    5s    Wait Until Element Is Visible    id_postcode_error    5s
    ${actualPostCodeErrorMsg}    Get Text    id_postcode_error
    Should Be Equal As Strings    ${actualPostCodeErrorMsg}    @{expectedPostCodeErrorMessage}[1]
    [Teardown]    Close All Browsers

TC0005-Verify Application Throwing Error when invalid House Name is entered
    [Tags]    TC0005
    InvokeBrowser
    Input Text    id_house_number    ${InvalidHouseNumber}
    Press Key    id_house_number    \\09
    Wait Until Keyword Succeeds    20s    5s    Wait Until Element Is Visible    id_house_number_error    5s
    ${actualHouseNumErrorMsg}    Get Text    id_house_number_error
    Should Be Equal As Strings    ${actualHouseNumErrorMsg}    @{expectedHouseNumberErrorMessage}[1]
    [Teardown]    Close All Browsers

TC0006-Verify Application Throwing Error when invalid street is entered
    [Tags]    TC0006
    InvokeBrowser
    Input Text    id_street    ${InvalidStreet}
    Press Key    id_street    \\09
    Wait Until Keyword Succeeds    20s    5s    Wait Until Element Is Visible    id_street_error    5s
    ${actualStreetErrorMsg}    Get text    id_street_error
    Should Be Equal As Strings    ${actualStreetErrorMsg}    @{expectedStreetErrorMessage}[1]
    [Teardown]    Close All Browsers

TC0007-Verify Application Throwing Error when invalid town is entered
    [Tags]    TC0007
    InvokeBrowser
    Input Text    id_town_or_city    ${InvalidTown}
    Press Key    id_town_or_city    \\09
    Wait Until Keyword Succeeds    20s    5s    Wait Until Element Is Visible    id_town_error    5s
    ${actualTownErrorMsg}    Get Text    id_town_error
    Should Be Equal As Strings    ${actualTownErrorMsg}    @{expectedTownCityErrorMessage}[1]
    [Teardown]    Close All Browsers

TC0008-Verify Application is allowing select the Time At Address field which is given by Customer
    [Tags]    TC0008
    InvokeBrowser
    Click Element    //span[text()='${oneToThreeMonth}']
    Click Element    //span[text()='${fourToSixMonth}']
    Click Element    //span[text()='${sevenToTweleveMonth}']
    Click Element    //span[text()='${oneToTwoYear}']
    Click Element    //span[text()='${twoToFourYear}']
    Click Element    //span[text()='${overSixYear}']
    [Teardown]    Close All Browsers

TC0009-Verify Application behaviour when Email and Confirm Email are Given as different by User
    [Tags]    TC0009
    InvokeBrowser
    Input Text    id_email    @{invalidConfirmEmail}[2]
    Input Text    id_confirmemail    @{invalidConfirmEmail}[0]
    Press Key    id_confirmemail    \\09
    ${actualEmailErrorMsg}    Get Text    id_confirmemail_error
    Should Be Equal As Strings    ${actualEmailErrorMsg}    @{expectedEmailErrorMessage}[2]
    [Teardown]    Close All Browsers

TC0010-Verify Application is allowing select all the fields which is given by Customer in type of Occupancy
    [Tags]    TC0010
    InvokeBrowser
    Click Element    //input[@id='id_type_of_occupancy_owned']/following-sibling::span[1]
    Click Element    //input[@id='id_type_of_occupancy_rental']/following-sibling::span[1]
    Click Element    //input[@id='id_type_of_occupancy_living_with_parents']/following-sibling::span[1]
    Click Element    //input[@id='id_type_of_occupancy_others']/following-sibling::span[1]
    [Teardown]    Close All Browsers

TC0011-Validating EmployerName with Special and Alpha Character
    [Tags]    TC0011
    InvokeBrowser
    Input Text    id_employer_name    @{invalidEmployerName}[0]
    Press Key    id_employer_name    \\09
    ${actualEmployeeErrorMsg}    Get Text    //input[@id='id_employer_name']/following-sibling::span[1]
    Should Be Equal As Strings    ${actualEmployeeErrorMsg}    @{expectedEmployerErrorMessage}[1]
    [Teardown]    Close All Browsers

TC0012-Verify Application is allowing select all the fields which is given by Customer in Primary Source of Income
    [Tags]    TC0012
    InvokeBrowser
    Click Element    //input[@id='id_primary_source_of_income_fulltime']/following-sibling::span[1]
    Click Element    //input[@id='id_primary_source_of_income_parttime']/following-sibling::span[1]
    Click Element    //input[@id='id_primary_source_of_income_temporary']/following-sibling::span[1]
    Click Element    //input[@id='id_primary_source_of_income_selfemployed']/following-sibling::span[1]
    Click Element    //input[@id='id_primary_source_of_income_unemployed']/following-sibling::span[1]
    Click Element    //input[@id='id_primary_source_of_income_receiving_benefits']/following-sibling::span[1]
    [Teardown]    Close All Browsers

TC0013-Verify Application is allowing select all the fields which is given by Customer in Length Of Employment
    [Tags]    TC0013
    InvokeBrowser
    Click Element    //input[@id='id_length_of_employment_1-3months']/following-sibling::span[1]
    Click Element    //input[@id='id_length_of_employment_4-6months']/following-sibling::span[1]
    Click Element    //input[@id='id_length_of_employment_7-12months']/following-sibling::span[1]
    Click Element    //input[@id='id_length_of_employment_1-2years']/following-sibling::span[1]
    Click Element    //input[@id='2-4 years']/following-sibling::span[1]
    Click Element    //input[@id='id_length_of_employment_over4years']/following-sibling::span[1]
    [Teardown]    Close All Browsers

TC0014-Validating that application throwing Proper Error Message when income after tax \ is not entered
    [Tags]    TC0014
    InvokeBrowser
    Click Element    id_applypage_1_submit
    Press Key    id_applypage_1_submit    \\09
    ${actualIncomeAmountErrorMessage}    Get Text    //input[@id='id_income']/following-sibling::span
    Should Be Equal As Strings    ${actualIncomeAmountErrorMessage}    @{expectedIncomeAmountErrorMessage}[0]
    [Teardown]    Close All Browsers

TC0015-Validating that application throwing Proper Error Message when invalid income after tax \ amount is entered
    [Tags]    TC0015
    InvokeBrowser
    Input Text    id_income    @{incomeTaxAmount}[1]
    Press Key    id_income    \\09
    Sleep    5s
    ${actualIncomeAmountErrorMessage}    Get Text    //input[@id='id_income']/following-sibling::span
    Should Be Equal As Strings    ${actualIncomeAmountErrorMessage}    @{expectedIncomeAmountErrorMessage}[1]
    [Teardown]    Close All Browsers

TC0016-Validating that application behaviour when valid income after tax \ amount is entered
    [Tags]    TC0016
    InvokeBrowser
    Input Text    id_income    @{incomeTaxAmount}[3]
    Press Key    id_income    \\09
    Sleep    5s
    Should Not Be Equal As Strings    //input[@id='id_income']/following-sibling::div    @{expectedIncomeAmountErrorMessage}[1]
    [Teardown]    Close All Browsers

TC0017-Verify application is allowing to select the fields which are in Per(Income Tax)
    [Tags]    TC0017
    InvokeBrowser
    Click Element    //input[@id='id_income_per_month']/following-sibling::span[1]
    Click Element    //input[@id='id_income_per_week']/following-sibling::span[1]
    [Teardown]    Close All Browsers

TC0018-Verify Application is allowing select all the fields which is given by Customer in how often do you get paid
    [Tags]    TC0018
    InvokeBrowser
    Click Element    //input[@id='id_how_often_do_you_get_paid_mothly']/following-sibling::span[1]
    Click Element    //input[@id='id_how_often_do_you_get_paid_every_four_weeks']/following-sibling::span[1]
    Click Element    //input[@id='id_how_often_do_you_get_paid_every_two_weeks']/following-sibling::span[1]
    Click Element    //input[@id='id_how_often_do_you_get_paid_weekly']/following-sibling::span[1]
    Click Element    //input[@id='id_how_often_do_you_get_paid_twice_in_a_month']/following-sibling::span[1]
    [Teardown]    Close All Browsers

TC0019-Verify Application displaying the selected amount with Rent / Mortgage Link Description
    [Tags]    TC0019
    InvokeBrowser
    Click Element    //input[@id='id_rent_or_mortgage_51-100']/following::span[1]
    ${enteredAmount}    Get Text    //input[@id='id_rent_or_mortgage_51-100']/following::span[1]
    Element Should Contain    //dt[text()='Rent / Mortgage ']/span    ${enteredAmount}
    [Teardown]    Close All Browsers

TC0022-Verify Application displaying week day names in "week days \ names in dropDown List" when customer select both fields as Week in Per/How often do you get paid
    [Tags]    TC0022
    InvokeBrowser
    Click Element    //span[text()='Week']
    Click Element    //span[text()='${howOftenDoYouGetPaidEveryFourWeeks}']
    ${items}    Get List Items    id=freq_2
    ${list_length}    Get Length    ${items}
    Should Be True    ${list_length} > 1
    Log To Console    ${list_length}
    : FOR    ${ItemPrint}    IN    ${items}
    \    Log    ${ItemPrint}
    Log    Item iteration is over
    [Teardown]    Close All Browsers

TC0023-Verify Application displaying list of value in "choose Frequency dropDown List "when customer select both fields as Month in Per/How often do you get paid
    [Tags]    TC0023
    InvokeBrowser
    Click Element    //span[text()='Month']
    Click Element    //span[text()='${howOftenDoYouGetPaidMonthly}']
    ${items}    Get List Items    id=get_paid_label
    ${list_length}    Get Length    ${items}
    Should Be True    ${list_length} > 1
    Log To Console    ${list_length}
    : FOR    ${ItemPrint}    IN    ${items}
    \    Log    ${ItemPrint}
    Log    Item iteration is over
    [Teardown]    Close All Browsers

TC0024-Verify Application displaying list of value in "Paid on Every dropDown List "when customer select both fields as week/Weekly \ in Per/How often do you get paid
    [Tags]    TC0024
    InvokeBrowser
    Click Element    //span[text()='Week']
    Click Element    //span[text()='${howOftenDoYouGetPaidMonthlyWeekly}']
    ${actualDropDownName}    Get Text    //label[text()='Paid on Every']
    ${expectedDropDownName}    Set Variable    Paid on Every
    Should Be Equal As Strings    ${actualDropDownName}    ${expectedDropDownName}    message    True
    ${listofItems}    Get List Items    freq_4
    ${list_length}    Get Length    ${listofItems}
    Should Be True    ${list_length} > 1
    Log To Console    ${list_length}
    : FOR    ${ItemPrint}    IN    ${listofItems}
    \    Log    ${ItemPrint}
    Log    Item iteration is over
    [Teardown]    Close All Browsers

TC0025-Verify Application displaying two dropdown list "S elect paydate1and Select Paydate2"when customer select both fields as week/Twice in month field in Per/How often do you get paid
    [Tags]    TC0025
    InvokeBrowser
    Click Element    //span[text()='Week']
    Click Element    //span[text()='${howOftenDoYouGetPaidMonthlyTwiceInMonth}']
    ${actualDropDownName1}    Get Text    //label[text()='Select paydate 1']
    ${expectedDropDownName1}    Set Variable    Select paydate 1
    Should Be Equal As Strings    ${actualDropDownName1}    ${expectedDropDownName1}    message    True
    ${actualDropDownName2}    Get Text    //label[text()='Select paydate 2']
    ${expectedDropDownName2}    Set Variable    Select paydate 2
    Should Be Equal As Strings    ${actualDropDownName2}    ${expectedDropDownName2}    message    True
    ${listofItems1}    Get List Items    freq_5
    ${list_length1}    Get Length    ${listofItems1}
    Should Be True    ${list_length1} > 1
    Comment    Log To Console    ${list_length1}
    Comment    :FOR    ${ItemPrint}    IN    ${listofItems1}
    Comment    \    Log    ${ItemPrint}
    Log    Item iteration is over for Select PayDate1
    ${listofItems2}    Get List Items    freq_6
    ${list_length2}    Get Length    ${listofItems2}
    Should Be True    ${list_length2} > 1
    Comment    Log To Console    ${list_length1}
    Comment    :FOR    ${ItemPrint}    IN    ${listofItems2}
    Comment    \    Log    ${ItemPrint}
    Log    Item iteration is over for Select PayDate2
    [Teardown]    Close All Browsers

TC0026-Verify Application displaying \ days of week in dropdown when customer select Month and Every Four week in Per/How often do you get paid
    [Tags]    TC0026
    InvokeBrowser
    Click Element    //span[text()='Month']
    Click Element    //span[text()='${howOftenDoYouGetPaidEveryFourWeeks}']
    ${actualDropDownName1}    Get Text    //label[text()='Day of week']
    ${expectedDropDownName1}    Set Variable    Day of week
    Should Be Equal As Strings    ${actualDropDownName1}    ${expectedDropDownName1}    message    True
    ${listofItems1}    Get List Items    freq_2
    ${list_length1}    Get Length    ${listofItems1}
    Should Be True    ${list_length1} > 1
    Log    Item iteration is over for Days of Week
    [Teardown]    Close All Browsers

TC0030-Verify application giving proper error message when no fields are filled in ApplyPage1
    [Tags]    TC0030
    InvokeBrowser
    Click Button    id_applypage_1_submit
    ${actualTitleErrorMessage}    Get Text    id_title_error
    Should Be Equal As Strings    @{expectedTitleErrorMessage}[0]    ${actualTitleErrorMessage}
    ${actualFirstNameErrorMessage}    Get Text    id_firstname_error
    Should Be Equal As Strings    @{expectedFirstNameErrorMessage}[0]    ${actualFirstNameErrorMessage}
    ${actualLastNameErrorMessage}    Get Text    id_lastname_error
    Should Be Equal As Strings    @{expectedLastNameErrorMessage}[0]    ${actualLastNameErrorMessage}
    ${actualDateOfBirthErrorMessage}    Get Text    id_dob_error
    Should Be Equal As Strings    @{expectedDateOfBirthErrorMessage}[0]    ${actualDateOfBirthErrorMessage}
    ${actualMaritalStatusErrorMessage}    Get Text    id_marital_status_error
    Should Be Equal As Strings    @{expectedMaritalStatusErrorMessage}[0]    ${actualMaritalStatusErrorMessage}
    ${actualNumberOfDependencyErrorMessage}    Get Text    id_no_of_dependents_error
    Should Be Equal As Strings    @{expectedNumberOfDependencyErrorMessage}[0]    ${actualNumberOfDependencyErrorMessage}
    ${actualEmailErrorMessage}    Get Text    id_email_error
    Should Be Equal As Strings    @{expectedEmailErrorMessage}[0]    ${actualEmailErrorMessage}
    ${actualEmailErrorMessage}    Get Text    id_confirmemail_error
    Should Be Equal As Strings    @{expectedEmailErrorMessage}[0]    ${actualEmailErrorMessage}
    ${actualMobileNumberErrorMessage}    Get Text    id_mobile_number_error
    Should Be Equal As Strings    @{expectedMobileNumberErrorMessage}[0]    ${actualMobileNumberErrorMessage}
    ${actualPostCodeErrorMessage}    Get Text    id_postcode_error
    Should Be Equal As Strings    @{expectedPostCodeErrorMessage}[0]    ${actualPostCodeErrorMessage}
    ${actualHouseNumberErrorMessage}    Get Text    id_house_number_error
    Should Be Equal As Strings    @{expectedHouseNumberErrorMessage}[0]    ${actualHouseNumberErrorMessage}
    ${actualStreetErrorMessage}    Get Text    id_street_error
    Should Be Equal As Strings    @{expectedStreetErrorMessage}[0]    ${actualStreetErrorMessage}
    ${actualTownCityErrorMessage}    Get Text    id_town_error
    Should Be Equal As Strings    @{expectedTownCityErrorMessage}[0]    ${actualTownCityErrorMessage}
    Comment    ${actualTimeAtAddressErrorMessage}    Get Text    id_time_at_address_error
    Comment    Should Be Equal As Strings    @{expectedTimeAtAddressErrorMessage}[0]    ${actualTimeAtAddressErrorMessage}
    ${expectedTypeOfOccupancyErrorMessage}    Get Text    id_type_of_occupancy_error
    Should Be Equal As Strings    @{expectedTypeOfOccupancyErrorMessage}[0]    ${expectedTypeOfOccupancyErrorMessage}
    Comment    ${expectedEmployerErrorMessage}    Get Text    id_employer_name_error
    Comment    Should Be Equal As Strings    @{expectedEmployerErrorMessage}[0]    ${expectedEmployerErrorMessage}
    ${expectedPrimarySourceOfIncomeErrorMessage}    Get Text    id_primary_source_of_income_error
    Should Be Equal As Strings    @{expectedPrimarySourceOfIncomeErrorMessage}[0]    ${expectedPrimarySourceOfIncomeErrorMessage}
    ${actualLengthOfEmploymentErrorMessage}    Get Text    id_length_of_employment_error
    Should Be Equal As Strings    @{expectedLengthOfEmploymentErrorMessage}[0]    ${actualLengthOfEmploymentErrorMessage}
    Comment    ${actualIncomeAmountErrorMessage}    Get Text    id_income_error
    Comment    Should Be Equal As Strings    @{expectedIncomeAmountErrorMessage} [0]    ${actualIncomeAmountErrorMessage}
    ${actualPerErrorMessage}    Get Text    id_income_per_error
    Should Be Equal As Strings    @{expectedPerErrorMessage}[0]    ${actualPerErrorMessage}
    Comment    ${actualHowOftenDoYouGetPaidErrorMessage}    Get Text    //p[text()='How often do you get paid?']/following-sibling::span
    Comment    Should Be Equal As Strings    @{expectedHowOftenDoYouGetPaidErrorMessage}[0]    ${actualHowOftenDoYouGetPaidErrorMessage}
    ${actualDollorAmountErrorMessage}    Get Text    id_rent_or_mortgage_error
    Should Be Equal As Strings    @{expectedDollorAmountErrorMessage}[0]    ${actualDollorAmountErrorMessage}
    ${actualDollorAmountErrorMessage}    Get Text    id_loans_or_creditcard_error
    Should Be Equal As Strings    @{expectedDollorAmountErrorMessage}[0]    ${actualDollorAmountErrorMessage}
    ${actualDollorAmountErrorMessage}    Get Text    id_utilities_or_bills_error
    Should Be Equal As Strings    @{expectedDollorAmountErrorMessage}[0]    ${actualDollorAmountErrorMessage}
    ${actualDollorAmountErrorMessage}    Get Text    id_transportation_error
    Should Be Equal As Strings    @{expectedDollorAmountErrorMessage}[0]    ${actualDollorAmountErrorMessage}
    ${actualDollorAmountErrorMessage}    Get Text    id_food_error
    Should Be Equal As Strings    @{expectedDollorAmountErrorMessage}[0]    ${actualDollorAmountErrorMessage}
    ${actualDollorAmountErrorMessage}    Get Text    id_other_monthly_expenses_error
    Should Be Equal As Strings    @{expectedDollorAmountErrorMessage}[0]    ${actualDollorAmountErrorMessage}
    ${actualConfirmCheckBoxErrorMessage}    Get Text    id_i_confirm_checkbox_error
    Should Be Equal As Strings    @{expectedConfirmCheckBoxErrorMessage}[0]    ${actualConfirmCheckBoxErrorMessage}
    [Teardown]    Close All Browsers

TC0031-Verify Application throwing error when confirm check box is not checked in apply page
    [Tags]    TC0031
    InvokeBrowser
    Click Element    id_title_mr
    Input Text    id_firstname    ${FirstNameWithAlpha}
    Input Text    id_lastname    ${LastNameWithAlpha}
    Input Text    exampleDate    12/05/1990
    Click Element    id_marital_status_single
    Click Element    //label[text()="${dependency}"]
    Email
    Input Text    id_mobile_number    @{mobileNumber}[0]
    PostalCode
    Click Element    //label[text()='${oneToThreeMonth}']
    Click Element    //label[text()='${rental}']
    Input Text    id_employer_name    @{employeeName}[0]
    Click Element    //label[text()='@{primarySourceOfIncomePartTime}[0]']
    Click Element    //label[text()='${lengthOfEmployment4-6 months}']
    Input Text    id_income    @{incomeTaxAmount}[3]
    Click Element    //label[text()='Month']
    Click Element    //label[text()='${howOftenDoYouGetPaidEveryFourWeeks}']
    Click Element    id_rent_or_mortgage_101-150
    Click Element    id_loans_or_creditcard_101-150
    Click Element    id_utilities_or_bills_401-450
    Click Element    id_transportation_450-500
    Click Element    id_food_401-450
    Click Element    id_other_monthly_expenses_401-450
    Click Button    id_applypage_1_submit
    ${actualConfirmCheckBoxErrorMessage}    Get Text    id_i_confirm_checkbox_error
    Should Be Equal As Strings    @{expectedConfirmCheckBoxErrorMessage}[0]    ${actualConfirmCheckBoxErrorMessage}
    [Teardown]    Close All Browsers

*** Keywords ***
InvokeBrowser
    Open Browser    ${url}    chrome
    Maximize Browser Window

DateOfBirth
    Select From List    id_dob_date    ${date}
    Select From List    id_dob_month    ${month}
    Select From List    id_dob_year    ${year}

Email
    Input Text    id_email    @{email}[0]
    Input Text    id_confirmemail    @{email}[0]

PostalCode
    Input Text    id_postcode    @{validPostalCode}[0]
    Input Text    id_house_number    @{validHouseNumber}[0]
    Input Text    id_street    @{validStreet}[0]
    Input Text    id_town_or_city    @{validTown}[0]
