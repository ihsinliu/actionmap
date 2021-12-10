# frozen_string_literal: true

require 'json'
class Rating < ApplicationRecord
    def self.all_ratings
        %w[1 2 3 4 5]
    end
end
