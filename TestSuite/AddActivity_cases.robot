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
${user_name}    "sneh@myscreencoach.com"
${user_password}    "Jaipur123*"
${window_height}	1200
${window_width}	1000
${remote_url}	None
${family}	"developer family"
*** Test Cases ***
Add_acvitity
	Login_and_creative_activity	"sam_activity"	"100"
	

*** Keywords ***
Suite Setup
    SW.Open Browser With Download Capabilities    https://manage-dev.myscreencoach.com/#/login  gc    remote_url=${remote_url}
	Set Window Size	${window_height}	${window_width}


Login_and_creative_activity
    [Arguments]	${name}	${award}
	Execute Javascript    window.location.reload(true);
	BuiltIn.sleep	7
	Execute Javascript    window.location.reload(true);
	SH.screen_wait
	Execute Javascript    document.querySelector("#app-container > flt-glass-pane").shadowRoot.querySelector("input").value=${user_name}
   	Press Keys    None    TAB
	Execute Javascript    document.querySelector("#app-container > flt-glass-pane").shadowRoot.querySelector("input").value=${user_password}
	Press Keys    None    TAB
	Press Keys    None    ENTER
	SH.screen_wait
	Press Keys    None    TAB
	Press Keys    None    TAB
	Execute Javascript    document.querySelector("#app-container > flt-glass-pane").shadowRoot.querySelector("input").value=${family}
	SH.select_family
	SH.screen_wait
	Press Keys    None    TAB
	Press Keys    None    TAB
	Press Keys    None    TAB
	Press Keys    None    ENTER
	Press Keys    None    TAB
	Press Keys    None    TAB
	Press Keys    None    ENTER
	SH.screen_wait
	Log	"Assigning activity name"
	Execute Javascript    document.querySelector("#app-container > flt-glass-pane").shadowRoot.querySelector("input").value=${name}
	SH.screen_wait
	Press Keys    None    TAB
	Press Keys    None    TAB
	Press Keys    None    ENTER
	SH.screen_wait
	Press Keys    None    TAB
	Press Keys    None    TAB
	Press Keys    None    TAB
	Press Keys    None    ENTER
	SH.screen_wait
	Log	"Clikcing activity award"
	Press Keys    None    TAB
	Press Keys    None    TAB
	Press Keys    None    TAB
	Press Keys    None    ENTER
	SH.screen_wait
	Press Keys    None    TAB
	SH.screen_wait
	Log	"Assigning activity award"
	Execute Javascript    document.querySelector("#app-container > flt-glass-pane").shadowRoot.querySelector("input").value=${award}
	Press Keys    None    TAB
	Press Keys    None    TAB
	Press Keys    None    TAB
	Press Keys    None    TAB
	Press Keys    None    ENTER
	Log	"Activity award added"
	Press Keys    None    ENTER
	Log	"Activity added"
	Capture Page Screenshot
	SH.screen_wait
	Press Keys    None    TAB
	Press Keys    None    TAB
	Press Keys    None    TAB
	Press Keys    None    TAB
	Press Keys    None    TAB
	Press Keys    None    TAB
	Press Keys    None    TAB
	Press Keys    None    TAB
	Press Keys    None    ENTER
	SH.screen_wait
	Execute javascript	document.body.style.zoom="130%"
	Capture Page Screenshot	message.png
	Execute javascript	document.body.style.zoom="100%"
	${image_text}=	OH.get_image_text	message.png
	Log	${image_text}
	SH.validate_message	${image_text}	${name}
	SH.screen_wait

   
       
Suite Teardown
    Close Browser




