# frozen_string_literal: true

require 'rails_helper'

describe MapController do
    describe 'create map' do
        it 'should redirect if state not found' do
            allow(State).to receive(:find_by).and_return(nil)
            get :state, params: { state_symbol: 'CA' }
            expect(response).to be_redirect
        end

        it 'should redirect if county not found' do
            state = State.new(name: 'California', symbol: 'CA', fips_code: 0o1, is_territory: 0, lat_min: 32.3,
                              lat_max: 42.0, long_min: 114.8, long_max: 124.24)
            allow(State).to receive(:find_by).and_return(state)
            allow(County).to receive(:find_by).and_return(nil)

            get :county, params: { std_fips_code: 1, state_symbol: 'CA' }
            expect(response).to be_redirect
        end
    end
end
