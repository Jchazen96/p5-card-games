class Card < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :game

    def Card.reset_game
        Card.all.update(user_id: nil)
    end 
end
