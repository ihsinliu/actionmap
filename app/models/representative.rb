# frozen_string_literal: true

require 'json'
class Representative < ApplicationRecord
    has_many :news_items, dependent: :delete_all

    def self.civic_api_to_representative_params(rep_info)
        reps = []

        rep_info.officials.each_with_index do |official, index|
            next if official.name.eql? 'VACANT'

            rep_info.offices.each do |office|
                office_contains_official(office, official, index)
            end
            create_rep(official.name, official.photo_url, official.party, official.address.to_s)

            reps.push(@rep)
        end

        reps
    end

    def self.create_rep(name, photourl, party, address)
        temp = address.split(/"([^"]*)"/)
        res = create_string(temp)
        rep_temp = Representative.where(name: name)
        if !rep_temp.empty?
            rep_temp.update({ name: name, ocdid: @ocdid_temp, title: @title_temp, photoUrl: photourl,
              party: party, address: res.join })
            @rep = rep_temp.first
        else
            @rep = Representative.create({ name: name, ocdid: @ocdid_temp, title: @title_temp, photoUrl: photourl,
                party: party, address: res.join })
        end
    end

    def self.office_contains_official(office, _official, index)
        return unless office.official_indices.include? index

        @ocdid_temp = office.division_id
        @title_temp = office.name
    end

    def self.create_string(temp)
        res = []
        unless temp.empty?
            res[0] = temp[3]
            res[1] = ', '
            res[2] = temp[1]
            res[3] = ', '
            res[4] = temp[5]
            res[5] = ', '
            res[6] = temp[7]
        end
        res
    end
end
