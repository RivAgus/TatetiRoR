class Player < ApplicationRecord
    has_many :games, dependent: :destroy

    validates :name, presence: true

    before_create :set_token
    

    def set_token
        self.token = SecureRandom.uuid
    end
end
