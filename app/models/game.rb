class Game < ApplicationRecord
    has_many :cards


    def Game.start_war(user1, user2)
        26.times do 
            user1.draw
            user2.draw
        end
    end

    def battle(user1, user2)
        card1 = user1.cards.sample
        card2 = user2.cards.sample
        puts "user1 card #{card1.value}"
        puts "user2 card #{card2.value}"
        if card1.value > card2.value
            puts 'user1 wins the battle'
            card2.update(user_id: user1.id)
        elsif card2.value > card1.value
            puts 'user2 wins the battle'
            card1.update(user_id: user2.id)
        else
            puts 'its a draw'

            user1_soldier1 = user1.cards.where.not(id: card1.id).sample
            user1_soldier1.update(user_id: nil)
            user1_soldier2 = user1.cards.where.not(id: card1.id).sample
            user1_soldier2.update(user_id: nil)
            user1_soldier3 = user1.cards.where.not(id: card1.id).sample
            user1_soldier3.update(user_id: nil)
            user1_war = user1.cards.where.not(id: card1.id).sample
            user1_war.update(user_id: nil)

 
            user2_soldier1 = user2.cards.where.not(id: card2.id).sample
            user2_soldier1.update(user_id: nil)
            user2_soldier2 = user2.cards.where.not(id: card2.id).sample
            user2_soldier2.update(user_id: nil)
            user2_soldier3 = user2.cards.where.not(id: card2.id).sample
            user2_soldier3.update(user_id: nil)
            user2_war = user2.cards.where.not(id: card2.id).sample
            user2_war.update(user_id: nil)


                if user1_war.value > user2_war.value
                    card2.update(user_id: user1.id)
                    user1_soldier1.update(user_id: user1.id)
                    user1_soldier2.update(user_id: user1.id)
                    user1_soldier3.update(user_id: user1.id)
                    user2_soldier1.update(user_id: user1.id)
                    user2_soldier2.update(user_id: user1.id)
                    user2_soldier3.update(user_id: user1.id)
                    user1_war.update(user_id: user1.id)
                    user2_war.update(user_id: user1.id)
                elsif user2_war.value > user1_war.value
                    card1.update(user_id: user2.id)
                    user2_soldier1.update(user_id: user2.id)
                    user2_soldier2.update(user_id: user2.id)
                    user2_soldier3.update(user_id: user2.id)
                    user1_soldier1.update(user_id: user2.id)
                    user1_soldier2.update(user_id: user2.id)
                    user1_soldier3.update(user_id: user2.id)
                    user1_war.update(user_id: user2.id)
                    user2_war.update(user_id: user2.id)
                else
                    battle(user1, user2)
                end
        end
    end

end
