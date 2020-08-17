class Response < ApplicationRecord 
    belongs_to :user 
    belongs_to :essay
    validates :content, presence: true 
    validates :essay, uniqueness: { scope: :user, message: "You have already responded to this essay." }
end