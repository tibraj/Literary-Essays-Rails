class Book < ApplicationRecord
    has_many :essays
    validates :title, presence: true, uniqueness: true 
    validates :author, presence: true, uniqueness: true
end