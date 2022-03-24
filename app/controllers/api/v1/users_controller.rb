class Api::V1::UsersController < Api::V1::ApiController
  skip_before_action :authorize_request

  def create
    user = User.create!(user_params)

    render json: user, status: :created
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
