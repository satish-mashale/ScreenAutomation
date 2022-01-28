*** Settings ***
Suite Setup       Suite Setup
Suite Teardown    Suite Teardown
#Test Setup        Test Setup
Library            Selenium2Library
Library           ${CURDIR}/../PythonLibrary/SeleniumWrapper.py    WITH NAME    SW
Library           ${CURDIR}/../PythonLibrary/ScreenHelper.py    WITH NAME    SH	
Library           ${CURDIR}/../PythonLibrary/OCRHelper.py    WITH NAME    OH
Resource         ${Resources}/Variables.robot

*** Variables ***
${user_name}	"sneh@myscreencoach.com"
${user_password}	"Jaipur123*"
${window_height}	1200
${window_width}	1000
${remote_url}	None
${family}	"developer family"
${images_path}	${CURDIR}/../
*** Test Cases ***
User_login
	SH.select_element_from_image_opencv	email_box.png	
	Execute Javascript    document.querySelector("#app-container > flt-glass-pane").shadowRoot.querySelector("input").value=${user_name}
	SH.select_element_from_image_opencv	password_box.png	
	Execute Javascript    document.querySelector("#app-container > flt-glass-pane").shadowRoot.querySelector("input").value=${user_password}
	SH.select_element_from_image_opencv	loginbtn.png
	SH.select_element_from_image_opencv	add_family.png
	Capture Page Screenshot	message.png

	

*** Keywords ***
Suite Setup
    SW.Open Browser With Download Capabilities    https://manage-dev.myscreencoach.com/#/login  gc    remote_url=${remote_url}
    Maximize Browser Window
	SH.select_element_from_image_opencv	welcome.png



locate_elements
    [Arguments]	${user_name}	${user_password}
	Maximize Browser Window
	Execute Javascript    window.location.reload(true); 
	Execute Javascript    window.location.reload(true);
	SH.screen_wait
	SH.login	${user_name}	${user_password}
	Capture Page Screenshot	
  
       
Suite Teardown
    Close Browser




