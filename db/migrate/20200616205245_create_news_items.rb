# frozen_string_literal: true

class CreateNewsItems < ActiveRecord::Migration[5.2]
    def up
        create_table :news_items do |t|
            t.string :title, null: false
            t.string :link, null: false
            t.text :description
            t.belongs_to :representative, null: false, index: true
            t.timestamps null: false
            t.string :rating, index: true, null: false
            t.string :issue, index: true, null: false
            t.string :owner, null: false, unique: true
        end
    end

    def down
        drop_table :news_items
    end
end
