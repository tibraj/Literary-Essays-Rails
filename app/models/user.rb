class User < ApplicationRecord 
    has_many :essays
    has_many :responses
    has_many :essay_responses, through: :responses, source: :essay
    validates :email, presence: true
    has_secure_password

    def self.create_by_omniauth(auth)
        self.find_or_create_by(email: auth[:info][:email]) do |u|
            u.name = auth[:info][:email]
            u.password = SecureRandom.hex
        end 
    end
end



#<%= link_to @response.essay.title, essay_path(@essay) %>
#<%= link_to "Edit Response", edit_response_path(@essay) if @response.user == current_user %><br>
#<%= button_to "Delete Response", response_path(@response), method: :delete if @response.user == current_user %>
