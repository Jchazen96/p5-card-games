class GamesController < ApplicationController
    skip_before_action :verify_authenticity_token


    #needs to pass in user ID
    def find_gofish
        game = Game.where(name: 'gofish').where(status: 'open').first
        user = User.find_by(id: params[:id])
        if game
            user.update(game_id: game.id)
            game.update(status: 'full')
            distribute_cards()
            user.update(is_turn: true)
            render json: {"game_id": game.id, "user_turn": user.is_turn, "user_cards": user.cards}
        else
            game = Game.create(name: 'gofish', status: 'open')
            Card.insert_all(
                [
                    {value: 2, suit: 'Diamonds', image: 'https://deckofcardsapi.com/static/img/2D.png', name: '2', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 2, suit: 'Clubs', image: 'https://deckofcardsapi.com/static/img/2C.png', name: '2', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 2, suit: 'Hearts', image: 'https://deckofcardsapi.com/static/img/2H.png', name: '2', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 2, suit: 'Spades', image: 'https://deckofcardsapi.com/static/img/2S.png', name: '2', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 3, suit: 'Diamonds', image: 'https://deckofcardsapi.com/static/img/3D.png', name: '3', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 3, suit: 'Clubs', image: 'https://deckofcardsapi.com/static/img/3C.png', name: '3', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 3, suit: 'Hearts', image: 'https://deckofcardsapi.com/static/img/3H.png', name: '3', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 3, suit: 'Spades', image: 'https://deckofcardsapi.com/static/img/3S.png', name: '3', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 4, suit: 'Diamonds', image: 'https://deckofcardsapi.com/static/img/4D.png', name: '4', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 4, suit: 'Clubs', image: 'https://deckofcardsapi.com/static/img/4C.png', name: '4', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 4, suit: 'Hearts', image: 'https://deckofcardsapi.com/static/img/4H.png', name: '4', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 4, suit: 'Spades', image: 'https://deckofcardsapi.com/static/img/4S.png', name: '4', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 5, suit: 'Diamonds', image: 'https://deckofcardsapi.com/static/img/5D.png', name: '5', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 5, suit: 'Clubs', image: 'https://deckofcardsapi.com/static/img/5C.png', name: '5', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 5, suit: 'Hearts', image: 'https://deckofcardsapi.com/static/img/5H.png', name: '5', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 5, suit: 'Spades', image: 'https://deckofcardsapi.com/static/img/5S.png', name: '5', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 6, suit: 'Diamonds', image: 'https://deckofcardsapi.com/static/img/6D.png', name: '6', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 6, suit: 'Clubs', image: 'https://deckofcardsapi.com/static/img/6C.png', name: '6', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 6, suit: 'Hearts', image: 'https://deckofcardsapi.com/static/img/6H.png', name: '6', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 6, suit: 'Spades', image: 'https://deckofcardsapi.com/static/img/6S.png', name: '6', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 7, suit: 'Diamonds', image: 'https://deckofcardsapi.com/static/img/7D.png', name: '7', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 7, suit: 'Clubs', image: 'https://deckofcardsapi.com/static/img/7C.png', name: '7', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 7, suit: 'Hearts', image: 'https://deckofcardsapi.com/static/img/7H.png', name: '7', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 7, suit: 'Spades', image: 'https://deckofcardsapi.com/static/img/7S.png', name: '7', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 8, suit: 'Diamonds', image: 'https://deckofcardsapi.com/static/img/8D.png', name: '8', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 8, suit: 'Clubs', image: 'https://deckofcardsapi.com/static/img/8C.png', name: '8', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 8, suit: 'Hearts', image: 'https://deckofcardsapi.com/static/img/8H.png', name: '8', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 8, suit: 'Spades', image: 'https://deckofcardsapi.com/static/img/8S.png', name: '8', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 9, suit: 'Diamonds', image: 'https://deckofcardsapi.com/static/img/9D.png', name: '9', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 9, suit: 'Clubs', image: 'https://deckofcardsapi.com/static/img/9C.png', name: '9', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 9, suit: 'Hearts', image: 'https://deckofcardsapi.com/static/img/9H.png', name: '9', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 9, suit: 'Spades', image: 'https://deckofcardsapi.com/static/img/9S.png', name: '9', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 10, suit: 'Diamonds', image: 'https://deckofcardsapi.com/static/img/0D.png', name: '10', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 10, suit: 'Clubs', image: 'https://deckofcardsapi.com/static/img/0C.png', name: '10', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 10, suit: 'Hearts', image: 'https://deckofcardsapi.com/static/img/0H.png', name: '10', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 10, suit: 'Spades', image: 'https://deckofcardsapi.com/static/img/0S.png', name: '10', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 11, suit: 'Diamonds', image: 'https://deckofcardsapi.com/static/img/JD.png', name: 'Jack', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 11, suit: 'Clubs', image: 'https://deckofcardsapi.com/static/img/JC.png', name: 'Jack', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 11, suit: 'Hearts', image: 'https://deckofcardsapi.com/static/img/JH.png', name: 'Jack', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 11, suit: 'Spades', image: 'https://deckofcardsapi.com/static/img/JS.png', name: 'Jack', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 12, suit: 'Diamonds', image: 'https://deckofcardsapi.com/static/img/QD.png', name: 'Queen', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 12, suit: 'Clubs', image: 'https://deckofcardsapi.com/static/img/QC.png', name: 'Queen', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 12, suit: 'Hearts', image: 'https://deckofcardsapi.com/static/img/QH.png', name: 'Queen', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 12, suit: 'Spades', image: 'https://deckofcardsapi.com/static/img/QS.png', name: 'Queen', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 13, suit: 'Diamonds', image: 'https://deckofcardsapi.com/static/img/KD.png', name: 'King', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 13, suit: 'Clubs', image: 'https://deckofcardsapi.com/static/img/KC.png', name: 'King', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 13, suit: 'Hearts', image: 'https://deckofcardsapi.com/static/img/KH.png', name: 'King', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 13, suit: 'Spades', image: 'https://deckofcardsapi.com/static/img/KS.png', name: 'King', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 14, suit: 'Diamonds', image: 'https://deckofcardsapi.com/static/img/AD.png', name: 'Ace', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 14, suit: 'Clubs', image: 'https://deckofcardsapi.com/static/img/AC.png', name: 'Ace', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 14, suit: 'Hearts', image: 'https://deckofcardsapi.com/static/img/AH.png', name: 'Ace', game_id: game.id, created_at: Time.current, updated_at: Time.current},
                    {value: 14, suit: 'Spades', image: 'https://deckofcardsapi.com/static/img/AS.png', name: 'Ace', game_id: game.id, created_at: Time.current, updated_at: Time.current}
                ]
            )
            user.update(game_id: game.id)
            distribute_cards()
            user.update(is_turn: false)
            render json: {"game_id": game.id, "user_turn": user.is_turn, "user_cards": user.cards}
        end

        #for websocket
        ActionCable.server.broadcast 'games_channel', game
    end

    # /gofish/drawempty/:game_id?id=[:user_id]
    def draw_for_empty
        user = User.find_by(id: params[:id])
        game = Game.find_by(id: user.game_id)
        user2 = User.where(game_id: game.id).where.not(id: user.id)[0]
        user.draw
        user.update(is_turn: false)
        user2.update(is_turn: true)
        render json: {"user_turn": user.is_turn, "user_cards": user.cards} 
    end

    # /gofish/refresh/:game_id?id=[:user_id]
    def refresh_gofish
        user = User.find_by(id: params[:id])
        game = Game.find_by(id: params[:game_id])
        if User.where(game_id: game.id).count == 2
            requesting_user = User.where(game_id: game.id).where(is_turn: false).first
            if Card.where(in_set: true).count == 52
                Card.delete(Card.all.where(game_id: game.id))
                return render json: {message: 'Game Over'}
            else
                user = User.find_by(id: params[:id])
                render json: {"user_turn": user.is_turn, "user_cards": user.cards, message: "#{requesting_user.username} requested card : #{game.requested_card}"}
            end
        else
            render json: {"user_turn": user.is_turn, "user_cards": user.cards, message: "Wait for other user to join"}
        end
    end

    # needs to pass in ID of user asking, and value they are asking for
    def ask_gofish
        asking_user = User.find_by(id: params[:id])
        game = Game.find_by(id: asking_user.game_id)
        asked_user = User.where(game_id: game.id).where.not(id: asking_user.id).first
        game.update(requested_card: params[:value])
        if asking_user.is_turn == true
            asking_user.update(is_turn: false)
            asked_user.update(is_turn: true)
            if asked_user.cards.where(value: params[:value]).count != 0
                asked_user.cards.where(value: params[:value]).all.update(user_id: params[:id])
                check_set()
                render json: {"user_turn": asking_user.is_turn, "user_cards": asking_user.cards, message: "#{asking_user.username} requested #{params[:value]}"}
            else
                asking_user.draw()
                check_set()
                                render json: {"user_turn": asking_user.is_turn, "user_cards": asking_user.cards, message: "#{asking_user.username} requested #{params[:value]}"}
            end
        else
                            render json: {"user_turn": asking_user.is_turn, "user_cards": asking_user.cards, message: "#{asking_user.username} requested #{params[:value]}"}
        end
    end

    def distribute_cards
        user = User.find_by(id: params[:id])
        game = Game.find_by(id: user.game_id)
        user.cards.delete(Card.all.where.not(game_id: game.id))
        7.times do
            user_card = Card.where(in_use:false).where(game_id: game.id).sample
            user_card.update(in_use:true, user_id: user.id)
        end
    end 

    def check_set
        user = User.find_by(id: params[:id])
        i = 2
        while i <= 14
            if user.cards.where(value: i).count == 4
                user.cards.where(value: i).all.update(in_set: true)
            end
            i = i+1
        end
        
    end

end
