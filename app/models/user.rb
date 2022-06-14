class User < ApplicationRecord
    has_many :cards

    def draw 
        card = Card.where(user_id: nil).sample
        card.update(user_id: id)
    end

    def cards
        Card.where(user_id: id)
    end


end
