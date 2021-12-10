# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NewsItem, type: :model do
    pending "add some examples to (or delete) #{__FILE__}"
    context 'class method' do
        before(:each) do
            @new_representative = Representative.new(name: 'WTF')
            @new_item = NewsItem.new(title: 'xxx', link: 'http://www.example.com/', description: 'gg',
                                     representative: @new_representative)
        end
        it 'should be able to find that person' do
            expect(NewsItem.find_for('WTF')).to eq(nil)
        end
    end
end
