class MainController < ApplicationController
  def index
  end

  def about
  end

  def profile
  end

  def noemail
    if params[:email].present?
      session[:omniauth]['info']['email'] = params[:email]
      redirect_to authorization_url
    end
  end
end
