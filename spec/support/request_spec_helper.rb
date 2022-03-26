module RequestSpecHelper
  def json_body
    JSON.parse(response.body, symbolize_names: true) if response.body.present?
  end

  def user_auth_token_header(user)
    post api_v1_authentications_path, params: { email: user.email, password: user.password }

    { Authorization: "Bearer #{json_body[:token]}" }
  end
end
