require 'rails_helper'

RSpec.describe Api::V1::RepositoriesController, type: :request do
  describe 'GET #index' do
    let(:user) { create(:user) }

    context 'when user is authenticated' do
      before do
        user
        get api_v1_repositories_path, params: { user: 'jaicke' }, headers: user_auth_token_header(user)
      end

      it 'must return 200 status' do
        expect(response).to have_http_status(:ok)
      end

      it 'must return repository fields' do
        expect(json_body[0]).to include(:id, :full_name, :description, :forks_count, :stargazers_count, :owner)
      end
    end

    context 'when user is not authenticated' do
      before do
        get api_v1_repositories_path, params: { user: 'jaicke' }
      end

      it 'must return 401 status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
