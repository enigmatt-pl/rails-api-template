class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  def authenticate
    auth_token =
      AuthenticateSubscriber.new(
        auth_params[:login],
        auth_params[:password]
      ).call

    json_response(auth_token: auth_token)
  end

  private
    def auth_params
      params.permit(:login, :password)
    end
end
