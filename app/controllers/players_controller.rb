class PlayersController < ApplicationController
    before_action :set_player, only: [:show]
    before_action :check_token, except: [:create]

    def index
        @player = Player.all
        render json: @player
    end

    def create
        @player = Player.new(params_player)
        render_response
    end

    def show
        render status: 200, json: {player: @player}
    end
    
private
    def params_player
        params.require(:player).permit(:name)
    end

    def render_response
        if @player.save
            render status: 200, json: {player: @player}
        else 
            reder status: 400, json: {message: @player.errors.details}
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
