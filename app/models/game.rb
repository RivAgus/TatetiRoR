class Game < ApplicationRecord

    before_create :set_board

    def set_board
        self.board = Array.new(9)
    end
end
