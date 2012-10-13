class UserController < ApplicationController
  protect_from_forgery
  before_filter :authenticate_user!, :only => [:profile, :force_earn]

  def profile

  end

  def public
    username = request.params[:username]
    @user = User.find_by_nickname username
    if !@user
      raise ActiveRecord::RecordNotFound
    end
  end

  def force_earn
    current_user.earn_achievements

    a = Achievement::ForeverAlone.new
    a.got_it = true
    a.user = current_user

    render :partial => 'user/achievements', :locals => {user: current_user}
  end
end
