class AuthenticationsController < ApplicationController

  def create
    auth = request.env['omniauth.auth']
    render json: auth.to_json
  end

end