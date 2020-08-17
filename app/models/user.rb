class User < ApplicationRecord 
    has_many :essays
    has_many :responses
    has_many :essay_responses, through: :responses, source: :essay
    validates :email, presence: true
    has_secure_password
end