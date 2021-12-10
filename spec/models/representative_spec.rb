# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe Representative do
    describe 'copy value' do
        before do
            office = double('office', name: 'president', division_id: '1', official_indices: [0, 1, 2, 3])
            official = double('official', name: 'joe', party: 'fff', address: "{'a': 'b'}", photo_url: 'example.com')
            rep_info = double('info', offices: [office], officials: [official])
            @representative = Representative.civic_api_to_representative_params(rep_info)[0]
        end
        it 'assign value' do
            expect(@representative.name).to eq('joe')
        end
    end
end
