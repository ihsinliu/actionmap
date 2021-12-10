# frozen_string_literal: true

class AddPhotoUrlToRepresentative < ActiveRecord::Migration[5.2]
    def change
        add_column :representatives, :photoUrl, :string
    end
end
