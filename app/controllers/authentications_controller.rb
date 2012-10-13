class AuthenticationsController < ApplicationController

  def create
    auth = request.env['omniauth.auth'] || session[:omniauth]
    authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])

    if authentication.nil? && auth['info']['email'].blank?
      session[:omniauth] = auth
      redirect_to noemail_url
    else
      authenticate! authentication, auth
    end
  end

  private

  def authenticate! authentication, auth
    if authentication
      flash[:notice] = "Signed in successfully"
      sign_in_and_redirect(:user, authentication.user)
    else
      user = User.new
      user.apply_omniauth(auth)
      if user.save(validate: false)
        flash[:notice] = "Account created and signed in successfully"
        user.async_earn_achievements unless user.achievements_fetched_at.nil?
        sign_in_and_redirect(:user, user)
      else
        flash[:error] = "Error while creating user account"
        redirect_to root_url
      end
    end
  end

end