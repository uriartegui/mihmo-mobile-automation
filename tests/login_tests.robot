*** Settings ***
Resource    ../resources/keywords.robot

*** Test Cases ***
Login With Valid Account
    Open App Clean
    
    Click Login Button
    
    Ask For Credentials
    
    Login With Credentials
    
    Handle Daily Feeling Screen
    
    [Teardown]    Close App Safely

Login With Conected Account
    Open App With Session

    [Teardown]    Close App Safely

First Access
    Open App Clean

    First Access Button

    [Teardown]    Close App Safely
