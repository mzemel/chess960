# The abstract representation of pieces
class Piece

  NAME_MAP = {
    1=>"White Queen's Rook",
    2=>"White Queen's Knight",
    3=>"White Queen's Bishop",
    4=>"White Queen",
    5=>"White King",
    6=>"White King's Bishop",
    7=>"White King's Knight",
    8=>"White King's Rook",
    9=>"White Queen's Rook's Pawn",
    10=>"White Queen's Knight's Pawn",
    11=>"White Queen's Bishop's Pawn",
    12=>"White Queen's Pawn",
    13=>"White King's Pawn",
    14=>"White King's Bishop's Pawn",
    15=>"White King's Knight's Pawn",
    16=>"White King's Rook's Pawn",
    17=>"Black King's Rook's Pawn",
    18=>"Black King's Knight's Pawn",
    19=>"Black King's Bishop's Pawn",
    20=>"Black King's Pawn",
    21=>"Black Queen's Pawn",
    22=>"Black Queen's Bishop's Pawn",
    23=>"Black Queen's Knight's Pawn",
    24=>"Black Queen's Rook's Pawn",
    25=>"Black King's Rook",
    26=>"Black King's Knight",
    27=>"Black King's Bishop",
    28=>"Black King",
    29=>"Black Queen",
    30=>"Black Queen's Bishop",
    31=>"Black Queen's Knight",
    32=>"Black Queen's Rook"
  }

  def name
    Piece::NAME_MAP[id]
  rescue
    "ID out of bounds"
  end

end