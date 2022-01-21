from os import closerange
from PIL import Image
import pytesseract as tess

class OCRHelper():

	def get_image_text(self,image_name):
		image = Image.open(image_name)
		text = tess.image_to_string(image, lang="eng")
		print(text)
		return	text
