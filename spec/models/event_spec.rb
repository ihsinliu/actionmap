# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
    pending "add some examples to (or delete) #{__FILE__}"
    describe 'class method' do
        before(:each) do
            # @new_county = class_double("county")
            @new_county =
                @start_time = DateTime.parse('2020-01-29T13:46:16.033+0100')
            @end_time = DateTime.parse('2020-02-19T13:20:50.539+0100')
            @new_event = Event.new(name: 'explosion', description: 'explosion, WTF', start_time: @start_time,
                                   end_time: @end_time)
        end
        it 'should return the corret id' do
            expect(@new_event.county_names_by_id).not_to eq(nil)
        end
    end
end
