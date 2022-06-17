class PlayersController < ApplicationController

    def create
        player = Player.create()
        render json: player
    end

    
end
