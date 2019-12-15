require 'RMagick'
include Magick

img = ImageList.new('pics/saga2dices.jpg')

cropped = img.crop( 10, 10, 10, 10, true)

cropped.write( 'pics/die1-face1.jpg' )