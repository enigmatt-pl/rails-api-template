class AuthenticateSubscriber
  def initialize(login, password)
    @login = login
    @password = password
  end

  # Service entry point
  def call
    JsonWebToken.encode(subscriber_id: subscriber.id) if subscriber
  end

  private
    attr_reader :login, :password

    # verify subscriber credentials
    def subscriber
      subscriber = Subscriber.find_by(login: login)
      return subscriber if subscriber&.authenticate(password)
      # raise Authentication error if credentials are invalid
      raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
    end
end
