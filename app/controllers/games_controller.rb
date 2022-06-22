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
            user.update(game_id: game.id)
            distribute_cards()
            user.update(is_turn: false)
            render json: {"game_id": game.id, "user_turn": user.is_turn, "user_cards": user.cards}
        end

        #for websocket
        ActionCable.server.broadcast 'games_channel', game
    end

    # /gofish/refresh/:game_id?id=[:user_id]
    def refresh_gofish
        if Card.where(in_set: true).count == 52
            return render json: {message: 'Game Over'}
        else
            user = User.find_by(id: params[:id])
            render json: {"user_turn": user.is_turn, "user_cards": user.cards}
        end
    end

    # needs to pass in ID of user asking, and value they are asking for
    def ask_gofish
        asking_user = User.find_by(id: params[:id])
        game = Game.find_by(id: asking_user.game_id)
        asked_user = User.where(game_id: game.id).where.not(id: asking_user.id).first
        
        if asking_user.is_turn == true
            asking_user.update(is_turn: false)
            asked_user.update(is_turn: true)
            if asked_user.cards.where(value: params[:value]).count != 0
                asked_user.cards.where(value: params[:value]).all.update(user_id: params[:id])
                check_set()
                render json: {"user_turn": asking_user.is_turn, "user_cards": asking_user.cards}
            else
                asking_user.draw()
                check_set()
                render json: {"user_turn": asking_user.is_turn, "user_cards": asking_user.cards}
            end
        else
            render json: {"user_turn": asking_user.is_turn, "user_cards": asking_user.cards}
        end
    end

    def distribute_cards
        user = User.find_by(id: params[:id])
        7.times do
            user_card = Card.where(in_use:false).sample
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
