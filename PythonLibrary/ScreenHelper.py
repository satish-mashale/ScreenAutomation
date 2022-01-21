import pyautogui as screen_ui
import time
import keyboard
class ScreenHelper(object):
	family_frame=252
	"""docstring for ClassName"""
	def __init__(self):
		print("inside init")
		

	def select_family(self):
		time.sleep(10)
		screen_ui.moveTo(self.family_frame, 400, duration = 1)
		screen_ui.click(self.family_frame, 400)
		time.sleep(15)
		

	def screen_wait(self):
		time.sleep(12)

	def select_element_from_image(self,image_name):
		time.sleep(5)
		screen_ui.click(self.family_frame, 400)
		screen_ui.keyDown('pgdn')
		time.sleep(2)
		element_box = screen_ui.locateCenterOnScreen(image_name,grayscale=True)
		print(element_box)	
		print("clicking "+str(image_name))
		screen_ui.click(element_box)

	def validate_message(self,main_string,message):
		message=message.replace('"','')
		print("Chcking message "+str(message))
		if message in main_string:
			print("validated message "+str(message))
		else:
			raise Exception("message validation failed")

	def login(self,user,password):
		password=str(password).strip()
		user=str(user).strip()
		start_time=time.time()
		print("inside login..")
		time.sleep(5)
		screen_ui.click(self.family_frame, 400)
		screen_ui.keyDown('pgdn')
		time.sleep(2)
		password_box = screen_ui.locateCenterOnScreen('password_box.png',grayscale=True)
		print(password_box)	
		print("clicking password_box.png")
		
		screen_ui.click(password_box)		
		print("typing "+str(password))
		keyboard.write("Jaipur123*")
		

		email_box = screen_ui.locateCenterOnScreen('email_box.png',grayscale=True)
		print(email_box)		
		print("clicking email_box.png")
		screen_ui.click(email_box)
		print("typing "+str(user))
		keyboard.write("sneh@myscreencoach.com")
		

		login_box = screen_ui.locateCenterOnScreen('login_box.png',grayscale=True)
		print(login_box)
		print("clicking login_box.png")
		screen_ui.click(login_box)
		screen_ui.click(login_box)
		screen_ui.click(login_box)
		end_time=time.time()

		print("total time taken  ="+str(end_time-start_time))
		print("Login is successful")
		time.sleep(10000)



#obj=ScreenHelper()
#obj.login("sneh@myscreencoach.com","Jaipur123*")