*** Settings ***
Documentation       A rsource file with reusable keywords and variables
. . .
. . .               The system specific key words created here from our own
                    domain specific language. They utilize keywords provided
. . .               by imported SeleniumLibrary.
. . .               SeleniumLibrary
Library             Operating system


*** Variables ***
${username}            rahulshettyacademy
${password}            learning
${InvalidUsername}     lisandrodossantossilvafernando
${InvalidPassword}     123456
${url}          https://rahulshettyacademy.com/loginpagePractise/

*** keywords ***
open the broswer with the Ecomerce payment url
        Create Webdriver 	    Firefox 	 executable_path=/Users/lisandrodossantossilvafernando/Downloads/geckodriver
        Go To       ${url}  

Close Browser Session
    Close Browser