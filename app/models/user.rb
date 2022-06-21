class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :password_digest, presence: true
    belongs_to :game, optional: true
    has_many :cards

    def draw 
        card = Card.where(user_id: nil).sample
        card.update(user_id: id)
        card.update(in_use: true)
    end

    def cards
        Card.where(user_id: id)
    end


end

