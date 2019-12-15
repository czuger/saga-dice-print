require 'RMagick'
include Magick

x = 825
y = 303

img = ImageList.new('pics/saga2dices.jpg')

cropped = img.crop( x, y, 100, 100, true)
cropped.write( 'pics/magie_face1.jpg' )

cropped = img.crop( x + 120, y, 100, 100, true)
cropped.write( 'pics/magie_face2.jpg' )

cropped = img.crop( x + 238, y, 100, 100, true)
cropped.write( 'pics/magie_face3.jpg' )
