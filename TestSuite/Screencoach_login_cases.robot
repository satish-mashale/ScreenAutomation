*** Settings ***
Suite Setup       Suite Setup
Suite Teardown    Suite Teardown
Test Setup        Test Setup
Library            Selenium2Library
Library           ${CURDIR}/../PythonLibrary/SeleniumWrapper.py    WITH NAME    SW
Library           ${CURDIR}/../PythonLibrary/ScreenHelper.py    WITH NAME    SH	
Library           ${CURDIR}/../PythonLibrary/OCRHelper.py    WITH NAME    OH	
Resource         ${Resources}/Variables.robot
*** Variables ***
${user_name}    "sneh@myscreencoach.com"
${user_password}    "Jaipur123*"
${window_height}	2000
${window_width}	2000
${remote_url}	None
${family}	"developer family"
*** Test Cases ***
Login_validation_for_incorrect_email_input
    [Tags]    rfj_p1
	SH.screen_wait
	Execute Javascript    document.querySelector("#app-container > flt-glass-pane").shadowRoot.querySelector("input").value="sam"
	Press Keys    None    TAB
	Press Keys    None    TAB
	Press Keys    None    ENTER
	Press Keys    None    TAB
	SH.screen_wait	
	Execute javascript	document.body.style.zoom="120%"
	Capture Page Screenshot	message.png
	${image_text}=	OH.get_image_text	message.png
	Log	${image_text}
	${validation_message}	Set Variable 	The email address is badly formatted
	SH.validate_message	${image_text}	${validation_message}	
	
Login_validation_for_valid_email_with_empty_password
    [Tags]    rfj_p1
	SH.screen_wait
	Execute Javascript    document.querySelector("#app-container > flt-glass-pane").shadowRoot.querySelector("input").value="sam.sam@sam.com"
	Press Keys    None    TAB
	Press Keys    None    TAB
	Press Keys    None    ENTER
	Press Keys    None    TAB
	SH.screen_wait	
	Execute javascript	document.body.style.zoom="120%"
	Capture Page Screenshot	message.png
	${image_text}=	OH.get_image_text	message.png
	Log	${image_text}
	${validation_message}	Set Variable 	The password is invalid or the user does not have a
	SH.validate_message	${image_text}	${validation_message}		
	
Login_validation_for_incorect_login_details
    [Tags]    rfj_p1
	SH.screen_wait
   	Execute Javascript    document.querySelector("#app-container > flt-glass-pane").shadowRoot.querySelector("input").value="sam.sam@sam.com"
	Press Keys    None    TAB
	Execute Javascript    document.querySelector("#app-container > flt-glass-pane").shadowRoot.querySelector("input").value="sam"
	Press Keys    None    TAB
	Press Keys    None    ENTER
	Press Keys    None    TAB
	SH.screen_wait	
	Execute javascript	document.body.style.zoom="120%"
	Capture Page Screenshot	message.png
	${image_text}=	OH.get_image_text	message.png
	Log	${image_text}
	${validation_message}	Set Variable 	There is no user record corresponding to this identi
	SH.validate_message	${image_text}	${validation_message}
	
Login_validation_for_successful_login_details
    [Tags]    rfj_p1
	SH.screen_wait
   	Execute Javascript    document.querySelector("#app-container > flt-glass-pane").shadowRoot.querySelector("input").value=${user_name}
	Press Keys    None    TAB
	Execute Javascript    document.querySelector("#app-container > flt-glass-pane").shadowRoot.querySelector("input").value=${user_password}
	Press Keys    None    TAB
	Press Keys    None    ENTER
	Press Keys    None    TAB
	SH.screen_wait	
	Execute javascript	document.body.style.zoom="120%"
	Capture Page Screenshot	message.png
	${image_text}=	OH.get_image_text	message.png
	Log	${image_text}
	${validation_message}	Set Variable 	Family List
	SH.validate_message	${image_text}	${validation_message}	

*** Keywords ***
Suite Setup
    SW.Open Browser With Download Capabilities    https://manage-dev.myscreencoach.com/#/login  gc    remote_url=${remote_url}
	Set Window Size	${window_height}	${window_width}
    Maximize Browser Window	
	
Test Setup
	Execute javascript	document.body.style.zoom="100%"
	Execute javascript	window.location.reload(true);
	
  
    
       
Suite Teardown
    Close Browser




