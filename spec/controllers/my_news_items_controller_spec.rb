# frozen_string_literal: true

require 'rails_helper'

describe MyNewsItemsController do
    describe 'items' do
        #     before do
        #       @rep = double("representative")
        #       @new_item = NewsItem.new(
        #         title:    'new_item',
        #         link:     'http://www.example.com/',
        #         description:   'I donnot know',
        #         representative:    @rep,
        #       )
        #     end
        it 'new item' do
            allow(NewsItem).to receive(:find).with(1).and_return(1)
            allow(NewsItem).to receive(:new)
            get :new, params: { representative_id: 1, id: 1 }
            expect(response).to be_redirect
        end
        #     it 'create new item' do
        #       item = double('newitem', save: true)
        #             #             allow(Event).to receive(:find).and_return(event)
        #       allow(NewsItem).to receive(:new).and_return(item)
        #        post :create, params: { name:        'news_item',
        #                                     title:   '1',
        #                                     description: 'disc',
        #                                     link:  'http://www.example.com/',
        #                                     representative_id:    1,
        #                                      id: 1}
        #
        #             expect(response).to be_redirect
        #     end
    end
end
