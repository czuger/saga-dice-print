require 'RMagick'
include Magick

final_picture = Image.new( 100 * 12 + 300 , 100 * 8 + 300 ) { self.background_color = 'white' }

dice = []

of1 = ImageList.new('pics/ordre_face1.jpg' )
of2 = ImageList.new('pics/ordre_face2.jpg' )
of3 = ImageList.new('pics/ordre_face3.jpg' )

mf1 = ImageList.new('pics/magie_face1.jpg' )
mf2 = ImageList.new('pics/magie_face2.jpg' )
mf3 = ImageList.new('pics/magie_face3.jpg' )

def create_dice( dice, faces_set )
  1.upto( 3 ).each{ dice << faces_set[ 0 ] }
  1.upto( 2 ).each{ dice << faces_set[ 1 ] }
  dice << faces_set[ 2 ]
  dice
end

1.upto( 8 ).each do
  dice = create_dice( dice, [ of1, of2, of3 ] )
end

1.upto( 7 ).each do
  dice = create_dice( dice, [ mf1, mf2, mf3 ] )
end

col = 0
row = 0

# p dice

until dice.empty?
  face = dice.shift

  # face.alpha(Magick::ActivateAlphaChannel)
  # f.alpha(Magick::ActivateAlphaChannel)

  next unless face

  final_picture.composite!( face, col * 100 + 5, row * 100 + 5, OverCompositeOp )

  col += 1

  if col >= 12
    col = 0
    row += 1
  end

end

final_picture.write( 'faces_sheet.jpg' )