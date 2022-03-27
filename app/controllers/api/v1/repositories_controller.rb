class Api::V1::RepositoriesController < Api::V1::ApiController
  def index
    repositories = Github::Repositories::Search.call!(params)

    render json: repositories, status: :ok
  end
end
