class UserController < ApplicationController
  protect_from_forgery
  before_filter :authenticate_user!, :only => [:profile]

  def profile

  end

  def public
    username = request.params[:username]
    @user = User.find_by_nickname username
    if !@user
      raise ActiveRecord::RecordNotFound
    end
  end
end
