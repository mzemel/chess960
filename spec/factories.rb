require 'factory_girl'

FactoryGirl.define do

  factory :user do
    User.create(name: "Whitney")
  end

  factory :game_user_join do
    user { FactoryGirl.create(:user) }
    color { 0 } # change to ordinal
  end

  factory :game, class: Game do
    users do
      [ 
        FactoryGirl.create(:user, name: "Whitney"),
        FactoryGirl.create(:user, name: "Blanch")
      ]
    end
