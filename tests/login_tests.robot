*** Settings ***
Resource    ../resources/keywords.robot

*** Test Cases ***
Login With Valid Account
    Open App
    
    Click Login Button
    
    Ask For Credentials
    
    Login With Credentials
    
    Handle Daily Feeling Screen
    
    Close App


