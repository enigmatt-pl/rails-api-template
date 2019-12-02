class AuthorizeApiRequest
  def initialize(headers = {})
    @headers = headers
  end

  # Service entry point - return valid subscriber object
  def call
    { subscriber: subscriber }
  end

  private

    attr_reader :headers

    def subscriber
      # check if subscriber is in the database
      # memoize subscriber object
      @subscriber ||= Subscriber.find(decoded_auth_token[:subscriber_id]) if decoded_auth_token
      # handle subscriber not found
    rescue ActiveRecord::RecordNotFound => e
      raise(ExceptionHandler::InvalidToken, "#{Message.invalid_token} #{e.message}")
    end

    # decode authentication token
    def decoded_auth_token
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    end

    # check for token in `Authorization` header
    def http_auth_header
      if headers['Authorization'].present?
        headers['Authorization'].split(' ').last
      else
        raise(ExceptionHandler::MissingToken, Message.missing_token)
      end
    end
end
