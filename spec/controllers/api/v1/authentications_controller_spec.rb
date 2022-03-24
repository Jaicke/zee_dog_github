require 'rails_helper'

RSpec.describe Api::V1::AuthenticationsController, type: :request do
  describe 'POST #create' do
    let(:user) { create(:user) }

    before do
      user
      post api_v1_authentications_path, params: credentials
    end

    context 'when credential is valid' do
      let(:credentials) { { email: user.email, password: user.password } }

      it 'must return 200 status' do
        debugger
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when credential is invalid' do
      let(:credentials) { { email: user.email, password: 'wrong password' } }

      it 'must return 401 status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
