class AuthenticationsController < ApplicationController

  def create
    auth = request.env['omniauth.auth']

    if auth['info']['email'].blank?
      redirect_to noemail_url
    end

    authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])

    if authentication
      flash[:notice] = "Signed in successfully"
      sign_in_and_redirect(:user, authentication.user)
    else
      user = User.new
      user.apply_omniauth(auth)
      if user.save(validate: false)
        flash[:notice] = "Account created and signed in successfully"
        sign_in_and_redirect(:user, user)
      else
        flash[:error] = "Error while creating user account"
        redirect_to root_url
      end
    end
  end

end