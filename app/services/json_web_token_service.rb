class JsonWebTokenService
  SECRET_KEY = Rails.application.secrets.secret_key_base. to_s
  DEFAULT_EXPIRATION_TIME = 24.hours.from_now

  def self.encode(payload, exp = DEFAULT_EXPIRATION_TIME)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end
