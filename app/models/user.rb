class User < ApplicationRecord
    validates :name, {presence: true}
    validates :password, {presence: true}

    has_secure_password

    def reviews
        return Review.where(user_id: self.id)
    end
end
