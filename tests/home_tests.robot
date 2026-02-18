*** Settings ***
Resource    ../resources/keywords.robot

*** Test Cases ***
Data User Menu
    Open App Clean

    Click Login Button

    Ask For Credentials

    Login With Credentials

    Handle Daily Feeling Screen

    Data User Button

    [Teardown]    Close App Safely

Tutorial Menu
    Open App With Session

    Tutorial Button

    [Teardown]    Close App Safely

Chat Menu
    Open App With Session

    Chat Button

    [Teardown]    Close App Safely

Notify Menu
    Open App With Session

    Notify Button

    [Teardown]    Close App Safely

Menu
    Open App With Session

    Menu Button

    [Teardown]    Close App Safely