module ControllerSpecHelper
  # generate tokens from subscriber id
  def token_generator(subscriber_id)
    JsonWebToken.encode(subscriber_id: subscriber_id)
  end

  # generate expired tokens from subscriber id
  def expired_token_generator(subscriber_id)
    JsonWebToken.encode({ subscriber_id: subscriber_id }, (Time.now.to_i - 10))
  end

  # return valid headers
  def valid_headers
    {
      "Authorization" => token_generator(subscriber.id),
      "Content-Type" => "application/json",
    }
  end

  # return invalid headers
  def invalid_headers
    {
      "Authorization" => nil,
      "Content-Type" => "application/json",
    }
  end
end
