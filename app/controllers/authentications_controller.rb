class AuthenticationsController < ApplicationController

  def create
    auth = request.env['omniauth.auth']

    authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])

    if authentication
      flash[:notice] = "Signed in successfully"
      sing_in_and_redirect(:user, authentication.user)
    else

    end
    render json: auth.to_json
  end

end