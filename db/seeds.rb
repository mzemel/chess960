# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#################
# Create pieces #
#################

whitney = User.create(name: "Whitney")
blanch  = User.create(name: "Blanch")

game = Game.setup_game(whitney, blanch)
game.moves << Move.create(game: game, start: "e2", finish: "e4").resolve
game.moves << Move.create(game: game, start: "e7", finish: "e5").resolve
game.moves << Move.create(game: game, start: "d2", finish: "d4").resolve
game.moves << Move.create(game: game, start: "e5", finish: "d4").resolve

