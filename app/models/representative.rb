# frozen_string_literal: true

class Representative < ApplicationRecord
    has_many :news_items, dependent: :delete_all

    def self.civic_api_to_representative_params(rep_info)
        reps = []

        rep_info.officials.each_with_index do |official, index|
          if official.name.eql? "VACANT"
            next
          end
            ocdid_temp = ''
            title_temp = ''
            
            rep_info.offices.each do |office|
                if office.official_indices.include? index
                    ocdid_temp = office.division_id
                    title_temp = office.name
                end
            end
          
          #state = addr[:state]
          #zip = addr[:zip]
          #city = addr[:city]
          #street = addr[:line1]

          rep = Representative.create!({ name: official.name, ocdid: ocdid_temp, title: title_temp, photoUrl: official.photo_url, party: official.party, street: official.address})
          #address street, city, state, zip
          if !reps.include? rep
            reps.push(rep)
          end
        end

        reps
    end
end
