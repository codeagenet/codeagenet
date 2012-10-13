class MainController < ApplicationController
  def index
  end

  def about
  end

  def profile
  end

  def noemail
    if (not params[:email].blank?) and valid_email?(params[:email])
      session[:omniauth]['info']['email'] = params[:email]
      redirect_to authorization_url
    else
      flash[:error] = 'Wrong email format, please re-enter'
    end
  end

  private

  def valid_email?(email)
    email_regex = %r{
      ^ # Start of string
      [0-9a-z] # First character
      [0-9a-z.+]+ # Middle characters
      [0-9a-z] # Last character
      @ # Separating @ character
      [0-9a-z] # Domain name begin
      [0-9a-z.-]+ # Domain name middle
      [0-9a-z] # Domain name end
      $ # End of string
    }xi # Case insensitive

    (email =~ email_regex)
  end
end
