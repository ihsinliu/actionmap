# frozen_string_literal: true

require 'json'
class Issue < ApplicationRecord
    belongs_to :news_items, dependent: :delete
    def self.all_issues
        ['Free Speech', 'Immigration', 'Terrorism', 'Social Security and Medicare',
         'Abortion', 'Student Loans', 'Gun Control', 'Unemployment', 'Climate Change',
         'Homelessness', 'Racism', 'Tax Reform', 'Net Neutrality', 'Religious Freedom',
         'Border Security', 'Minimum Wage', 'Equal Pay']
    end
end
