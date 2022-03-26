class Api::V1::RepositoriesController < Api::V1::ApiController
  def index
    repositories = Github::Repositories::Search.call!(params)

    render json: repositories, only: [:full_name, :description, :forks_count, :stargazers_count], status: :ok
  end
end
