# frozen_string_literal: true

class CreateRatings < ActiveRecord::Migration[5.2]
    def up
        create_table :ratings do |t|
            t.string :rating, null: false
            t.belongs_to :news_item
            t.belongs_to :user
            t.timestamps
        end
    end

    def down
        drop_table :ratings
    end
end
