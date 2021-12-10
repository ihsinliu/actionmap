# frozen_string_literal: true

require 'rails_helper'

RSpec.describe County, type: :model do
    pending "add some examples to (or delete) #{__FILE__}"
    context 'class method' do
        it 'should make 1 bit to 3 bits' do
            # @new_state = class_double("state")
            @new_state = State.new(name: 'California', symbol: 'CA', fips_code: 0o1, is_territory: 0, lat_min: 32.3,
                                   lat_max: 42.0, long_min: 114.8, long_max: 124.24)

            @new_county = County.new(name: 'berk', state: @new_state, fips_code: 3, fips_class: 'gg')
            expect(@new_county.std_fips_code).to eq('003')
        end
    end
end
