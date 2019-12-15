require 'RMagick'
include Magick

img = ImageList.new('pics/saga2dices.jpg')

y_decal = 119
x_decal = 413

empties_combo = [ [ 2, 5 ], [ 3, 3 ], [ 3, 4 ] ]

col_start = { 1 => 12, 2 => 424, 3 => 826 }

1.upto( 3 ).each do |col|
  1.upto( 5 ).each do |row|

    next if empties_combo.include?( [ col, row ] )

    cropped = img.crop( col_start[col], 12 + ( row - 1 ) * y_decal, 100, 100, true)
    cropped.write( "pics/col#{col}_row_#{row}_face1.jpg" )

    cropped = img.crop( col_start[col] + 120, 12 + ( row - 1 ) * y_decal, 100, 100, true)
    cropped.write( "pics/col#{col}_row_#{row}_face2.jpg" )

    cropped = img.crop( col_start[col] + 238, 12 + ( row - 1 ) * y_decal, 100, 100, true)
    cropped.write( "pics/col#{col}_row_#{row}_face3.jpg" )
  end
end