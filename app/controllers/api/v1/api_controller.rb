class Api::V1::ApiController < ApplicationController
  include ExceptionHandler

  before_action :authorize_request

  def authorize_request
    headers = request.headers['Authorization']
    header = headers.split(' ').last if headers

    @decoded = JsonWebTokenService.decode(header)
    @current_user = User.find(@decoded[:user_id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { errors: e.message }, status: :unauthorized
  rescue JWT::DecodeError => e
    render json: { errors: e.message }, status: :unauthorized
  end
end
