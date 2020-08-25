class Response < ApplicationRecord 
    belongs_to :user 
    belongs_to :essay
    validates :content, presence: true 
end