class PlayersController < ApplicationController
    before_action :set_player, only: [:show, :getname]
    before_action :check_token, except: [:create, :index, :getname]

    def index #GET /players
        @player = Player.all
        render json: @player
    end

    def create #POST /players
        @player = Player.new(params_player)
        render_response
    end

    def show #GET /players/:id
        render status: 200, json: {player: @player}
    end

    def getname #GET /players/:id/name
        render status: 200, json: {player: @player.name}
    end
    
private
    def params_player
        params.require(:player).permit(:name)
    end

    def render_response
        if @player.save
            render status: 200, json: {player: @player}
        else 
            render status: 400, json: {message: @player.errors.details}
        end
    end

    def set_player
        @player = Player.find_by(id: params[:id])
        if @player.blank?
            render status: 404, json: {message: "Player not found"}
            false
        end
    end

    def check_token
		return if request.headers["Authorization"] == "Bearer #{@player.token}"
			render status: 401, json:{message: "Wrong token"}
			false
	end
end
