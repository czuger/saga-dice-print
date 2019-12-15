require 'RMagick'
include Magick

final_picture = Image.new( 100 * 12 , 100 * 8 * 2 ) { self.background_color = 'white' }

dice = []

of1 = ImageList.new('pics/ordre_face1.jpg' ).resize( 0.8 )
of2 = ImageList.new('pics/ordre_face2.jpg' ).resize( 0.8 )
of3 = ImageList.new('pics/ordre_face3.jpg' ).resize( 0.8 )

mf1 = ImageList.new('pics/magie_face1.jpg' ).resize( 0.8 )
mf2 = ImageList.new('pics/magie_face2.jpg' ).resize( 0.8 )
mf3 = ImageList.new('pics/magie_face3.jpg' ).resize( 0.8 )

def create_dice( dice, faces_set )
  1.upto( 3 ).each{ dice << faces_set[ 0 ] }
  1.upto( 2 ).each{ dice << faces_set[ 1 ] }
  dice << faces_set[ 2 ]
  dice
end

# def round_corners( image )
#   cols = rows = 100
#   radius = 90
#
#   # Set a transparent background: pixels that are transparent will be
#   # discarded from the source image.
#   mask = Image.new(cols, rows) {self.background_color = 'transparent'}
#
#   # Create a white rectangle with rounded corners. This will become the
#   # mask for the area you want to retain in the original image.
#   Draw.new.stroke('none').stroke_width(0).fill('white').
#     roundrectangle(0, 0, cols, rows, radius, radius).
#     draw(mask)
#
#   # Apply the mask and write it out
#   image.composite!(mask, 0, 0, CopyAlphaCompositeOp)
#   image
# end
#
# of1 = round_corners( of1 )
# of2 = round_corners( of2 )
# of3 = round_corners( of3 )
#
# mf1 = round_corners( mf1 )
# mf2 = round_corners( mf2 )
# mf3 = round_corners( mf3 )

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

  next unless face

  final_picture.composite!( face, col * 100 + 7, row * 100 + 7, OverCompositeOp )

  col += 1

  if col >= 12
    col = 0
    row += 1
  end

end

final_picture.write( 'faces_sheet.jpg' )