# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
    pending "add some examples to (or delete) #{__FILE__}"
    context 'the name function should work correctly' do
        before(:each) do
            @user1 = User.create!(provider: 1, uid: 'I dont know',
                                  email: 'zhengshh_prime@berkeley.edu',
                                  first_name: 'Jasper',
                                  last_name: 'Chou')
        end
        context 'class method' do
            it 'should return the correct name' do
                expect(@user1.name).to eq('Jasper Chou')
            end

            it 'should not be able to find the user in google' do
                expect(User.find_google_user('I dont know')).not_to eql(nil)
            end

            it 'should bot be able to find the user in github' do
                expect(User.find_github_user('I dont know')).to eq(nil)
            end

            it 'should be able to use authprovider' do
                print(@user1.auth_provider)
            end
        end
    end
end
