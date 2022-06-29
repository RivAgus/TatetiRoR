class Player < ApplicationRecord

    validates :name, presence: true

    before_create :set_token
    # has_secure_token :token

    def set_token
        self.token = SecureRandom.uuid
    end
end
