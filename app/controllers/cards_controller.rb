class CardsController < ApplicationController

    def index
        cards = Card.all
        render json: cards
    end

    def destroy
        card = Card.find_by(id: params[:id])
        card.destroy
    end

    def draw
        card = Card.where(in_use: false).sample
        card.update(in_use: true)
        render json: card
    end

    def draw2
        card = Card.where(in_use: false).sample
        card.update(in_use: true)
        card2 = Card.where(in_use: false).sample
        card2.update(in_use: true)
        render json: [card, card2]
    end

    def start_go_fish
        cards = []
        7.times do
            card = Card.where(in_use: false).sample
            card.update(in_use: true)
            cards << card
        end
        render json: cards
    end

    private



end
