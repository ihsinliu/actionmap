# frozen_string_literal: true

require 'rails_helper'

RSpec.describe State, type: :model do
    pending "add some examples to (or delete) #{__FILE__}"
    before(:each) do
        @new_state = State.new(name: 'California', symbol: 'CA', fips_code: 0o1, is_territory: 0, lat_min: 32.3,
                               lat_max: 42.0, long_min: 114.8, long_max: 124.24)
    end
    context 'clas method' do
        it 'should change the flip_code' do
            expect(@new_state.std_fips_code).to eq('01')
        end
    end
end
