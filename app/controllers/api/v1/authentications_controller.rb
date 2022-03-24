class Api::V1::AuthenticationsController < Api::V1::ApiController
  skip_before_action :authorize_request

  def create
    user = User.find_by(email: authentication_params[:email])

    if user&.authenticate(authentication_params[:password])
      token = JsonWebTokenService.encode(user_id: user.id)

      render json: { token: token, }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def authentication_params
    params.permit(:email, :password)
  end
end
