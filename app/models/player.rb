class Player < ApplicationRecord

    def set_token
        self.token = SecureRandom.uuid
    end
end
