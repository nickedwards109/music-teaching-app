class JsonWebToken
  class << self
    def encode(payload)
      payload[:exp] = 12.hours.from_now.to_i
      JWT.encode(payload, Rails.application.credentials.secret_key_base, 'HS256')
    end

    def decode(token)
      JWT.decode(token, nil, false)
    end
  end
end
