class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :delete]
  
  def index #GET /games
    @game = Game.all
    render json: @game
  end
  
  def show #GET /games/:id
    render status: 200, json: {game: @game}
  end

  def create #POST /games
    @game = Game.new(game_params)
    render_response
  end

  def update #PATCH /games/:id
    @game.assign_attributes(game_params)
    render_response
  end

private
  def game_params
    params.permit(board: [])
  end
  def set_game
    @game = Game.find_by(id: params[:id])
    if @game.blank?
        render status: 404, json: {message: "Game not found"}
        false
    end
  end
  def render_response
    if @game.save
        render status: 200, json: {game: @game}
    else 
        reder status: 400, json: {message: @game.errors.details}
    end
  end
end
