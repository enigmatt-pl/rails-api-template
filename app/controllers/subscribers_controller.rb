class SubscribersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  # POST /signup
  # return authenticated token upon signup
  def create
    subscriber = Subscriber.create!(subscriber_params)
    auth_token =
      AuthenticateSubscriber.new(
        subscriber.login,
        subscriber.password
      ).call

    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  private

    def subscriber_params
      params.permit(
        :login,
        :password,
        :password_confirmation
      )
    end
end
