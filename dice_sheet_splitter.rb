require 'RMagick'
include Magick

img = ImageList.new('pics/saga2dices.jpg')

y_decal = 119

empties_combo = [ [ 2, 5 ], [ 3, 3 ], [ 3, 4 ], [ 3, 5 ] ]

col_start = { 1 => 12, 2 => 424, 3 => 825 }

dice_names = {
  [ 1, 1 ] => 'gallois', [ 1, 2 ] => 'vikings', [ 1, 3 ] => 'anglo_danois', [ 1, 4 ] => 'normands',
  [ 1, 5 ] => 'ecossais', [ 2, 1 ] => 'est', [ 2, 2 ] => 'musulmans', [ 2, 3 ] => 'croises',
  [ 2, 4 ] => 'teutoniques', [ 3, 1 ] => 'chaos', [ 3, 2 ] => 'ordre'
}

1.upto( 3 ).each do |col|

  y_decal -= 3 if col == 3

  1.upto( 5 ).each do |row|

    next if empties_combo.include?( [ col, row ] )

    cropped = img.crop( col_start[col], 12 + ( row - 1 ) * y_decal, 100, 100, true)
    cropped.write( "pics/#{dice_names[ [ col, row ] ] }_face1.jpg" )

    cropped = img.crop( col_start[col] + 120, 12 + ( row - 1 ) * y_decal, 100, 100, true)
    cropped.write( "pics/#{dice_names[ [ col, row ] ] }_face2.jpg" )

    cropped = img.crop( col_start[col] + 238, 12 + ( row - 1 ) * y_decal, 100, 100, true)
    cropped.write( "pics/#{dice_names[ [ col, row ] ] }_face3.jpg" )
  end
end