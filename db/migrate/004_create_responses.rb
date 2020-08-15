class CreateResponses < ActiveRecord::Migration[4.2]
    def change 
        create_table :responses do |t|
            t.string :content
            t.belongs_to :user, foreign_key: true
            t.belongs_to :essay, foreign_key: true
            t.timestamps
        end 
    end
end