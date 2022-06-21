class GamesController < ApplicationController
  
  before_action :set_game, only: [:show, :join, :update]
  
  def create #POST /games/
    @game = Game.new(game_state: "Waiting for player 2", player1_id: params[:player1_id], board_moves: 9)
    render_response
  end

  def join #PUT /games/:id/join
    if (params[:player2_id] != @game.player2_id)
      @game.assign_attributes(player2_id: params[:player2_id], is_turn: rand(1..2), game_state: "Started")
      render_response
    else
      render status: 400, json: {message: "Error joining the match, this player is already playing"}
    end
  end

  def show #GET /games/:id
    render status: 200, json: {game: @game}
  end

  def update #PUT/games
    if params[:played]
      set_tile_played
      @game.assign_attributes(is_turn: @game.is_turn == 2 ? 1 : 2, winner: params[:winner])
      render_response
    else
      check_moves_left
    end
  
  end

private
  def game_params
    params.require(:game).permit(:player1_id, :player2_id, :game_state, :played, :winner)
  end
  def set_game
    @game = Game.find_by(id: params[:id])
    if @game.blank?
        render status: 404, json: {message: "No match was found"}
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
  def set_tile_played
    if @is_turn == 1
      @game.board[params[:played]] = "X"
      @game.board_moves = @game.board_moves - 1
    else
      @game.board[params[:played]] = "O"
      @game.board_moves = @game.board_moves - 1
    end
  end
  def check_moves_left
    if(@game.board_moves == 0 && @game.winner.nil?)
      @game.assign_attributes(game_state: "Finished")
      render_response
    end
  end
end
