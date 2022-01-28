import pyautogui as screen_ui
import time
import keyboard
from cv2 import imread
from gui_automation import GuiAuto

class ScreenHelper(object):
	family_frame=252
	"""docstring for ClassName"""
	def __init__(self):
		print("inside init")
		
	def select_element_from_image_opencv(self,image_name):
		timer=1
		Gcursor=GuiAuto()
		screen_ui.click(self.family_frame, 400)
		while timer<10:
			if Gcursor.detect(imread("./images/"+image_name),0.9):
				print("got elemet clicking")
				Gcursor.click()
				return
			else:
				screen_ui.keyDown('pgdn')
				time.sleep(1)
				print("wating for "+str(image_name)+"for sec "+str(timer))
				timer=timer+1

		raise Exception("unable to find image "+str(image_name)+" on current screen")






#obj=ScreenHelper()
#obj.select_element_from_image_opencv("email_box.png")
#obj.select_element_from_image_opencv("loginbtn.png")
#obj.login("sneh@myscreencoach.com","Jaipur123*")
