class User < ApplicationRecord 
    has_many :essays
    has_many :responses
    has_many :essay_responses, through: :responses, source: :essay
    validates :name, presence: true
    validates :email, presence: true
    has_secure_password

    def self.create_by_omniauth(auth)
        self.find_or_create_by(email: auth[:info][:email]) do |u|
            u.name = auth[:info][:email]
            u.password = SecureRandom.hex
        end 
    end
end




