# frozen_string_literal: true

require 'rails_helper'
require 'rubygems'
require 'spec_helper'

describe LoginController do
    describe 'GET /index' do
        before do
            request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
            request.env['omniauth.auth']['uid'] = '1'
            request.env['omniauth.auth']['first_name'] = 'A'
            request.env['omniauth.auth']['last_name'] = 'B'
        end
        it 'should login successfully' do
            get :login
            expect(response).to have_http_status(200)
        end

        it 'should logout successfully' do
            get :logout
            expect(response).to redirect_to root_path
        end

        it 'should redirect successfully' do
            get :google_oauth2
            expect(response).to have_http_status(:redirect)
        end
    end
end
