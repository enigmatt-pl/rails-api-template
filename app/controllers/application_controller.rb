class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  attr_reader :current_subscriber

  before_action :authorize_request

  private
    def authorize_request
      @current_subscriber =
        AuthorizeApiRequest.new(request.headers).call[:subscriber]
    end
end
