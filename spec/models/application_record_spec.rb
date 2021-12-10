# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationRecord, type: :model do
    pending "add some examples to (or delete) #{__FILE__}"
    context 'class variable' do
        it 'should be true' do
            expect(ApplicationRecord.abstract_class).to eq(true)
        end
    end
end
