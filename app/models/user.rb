class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
    belongs_to :game, optional: true
    has_many :cards

    def draw 
        card = Card.where(user_id: nil).sample
        card.update(user_id: id)
    end

    def cards
        Card.where(user_id: id)
    end


end
