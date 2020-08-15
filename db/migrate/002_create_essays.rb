class CreateEssays < ActiveRecord::Migration[4.2]
    def change 
        create_table :essays do |t|
            t.string :title
            t.string :content
            t.belongs_to :user, foreign_key: true
            t.belongs_to :book, foreign_key: true 
            t.timestamps
        end 
    end 
end