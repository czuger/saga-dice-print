require 'RMagick'
include Magick

img = ImageList.new('pics/saga2dices.jpg')

col = 1
y_decal = 119
1.upto( 5 ).each do |row|
  cropped = img.crop( 12, 12 + ( row - 1 ) * y_decal, 100, 100, true)
  cropped.write( "pics/col#{col}_row_#{row}_face1.jpg" )

  cropped = img.crop( 132, 12 + ( row - 1 ) * y_decal, 100, 100, true)
  cropped.write( "pics/col#{col}_row_#{row}_face2.jpg" )

  cropped = img.crop( 248, 12 + ( row - 1 ) * y_decal, 100, 100, true)
  cropped.write( "pics/col#{col}_row_#{row}_face3.jpg" )
end

