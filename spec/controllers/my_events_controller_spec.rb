# frozen_string_literal: true

require 'rails_helper'

describe MyEventsController do
    describe 'Events' do
        before do
            @event1 = Event.new(
                name:        'event',
                description: 'disc',
                county:      @county,
                start_time:  Time.zone.now + 4.weeks,
                end_time:    Time.zone.now + 4.weeks + 1.hour
            )
        end

        it 'news event' do
            allow(Event).to receive(:find).with(1).and_return(1)
            allow(Event).to receive(:new)
            get :new, params: { id: 1 }
            expect(response).to be_redirect
        end

        it 'create event' do
            event = double('event', save: true)
            #             allow(Event).to receive(:find).and_return(event)
            allow(Event).to receive(:new).and_return(event)

            post :create, params: { name:        'event',
                                    county_id:   1,
                                    description: 'disc',
                                    start_time:  Time.zone.now + 4.weeks + 1.hour,
                                    end_time:    Time.zone.now + 4.weeks,
                                    id:          1 }

            expect(response).to be_redirect
        end
    end
end
