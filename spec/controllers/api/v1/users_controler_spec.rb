require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  describe 'POST #create' do
    before { post api_v1_users_path, params: user_attributes }

    context 'when is a valid user' do
      let(:user_attributes) { attributes_for(:user) }

      it 'must successfully create user' do
        expect(User.count).to eq 1
      end

      it 'must return 201 status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when is an invalid user' do
      let(:user_attributes) { attributes_for(:user, name: '') }

      it 'must user creation fail' do
        expect(User.count).to eq 0
      end

      it 'must return 422 status' do
        expect(json_body[:error_type]).to eq('record_invalid')
        expect(json_body[:errors].first).to eq([:name, ["can't be blank"]])
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
