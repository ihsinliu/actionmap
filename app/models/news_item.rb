# frozen_string_literal: true

class NewsItem < ApplicationRecord
    belongs_to :representative
    has_many :ratings, dependent: :delete_all
    has_one :issues, dependent: :delete

    def self.find_for(representative_id)
        NewsItem.find_by(
            representative_id: representative_id
        )
    end
end
