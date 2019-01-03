*** Settings ***
Library           HttpLibrary.HTTP

*** Variables ***
${API_ENDPOINT}    http://private-2012e-nguyenthethang.apiary-mock.com/questions?page=1

*** Test Cases ***
Test our very first REST API
    [Tags]    API
    GET    ${API_ENDPOINT}
    Response Status Code Should Equal    200
    ${result} =    Get Response Body
    ${json}=    Parse Json    ${result}
