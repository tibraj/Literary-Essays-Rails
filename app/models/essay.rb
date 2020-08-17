class Essay < ApplicationRecord
    belongs_to :user
    belongs_to :book
    has_many :responses
    has_many :responders, through: :responses, source: :user 
    accepts_nested_attributes_for :book 
end