# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

whitney = User.create(name: "Whitney")
blanch  = User.create(name: "Blanch")

game = Game.setup_game(whitney, blanch)
game.enter_move(Move.create(summary: "e4"))
game.enter_move(Move.create(summary: "e5"))
game.enter_move(Move.create(summary: "d4"))
game.enter_move(Move.create(summary: "exd4"))

