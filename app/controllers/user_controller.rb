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
    current_user.async_earn_achievements
    render :json => {last_at: current_user.achievements_fetched_at};
  end

  def poll_achievements
    last_at = params[:last_at]

    #render :text => current_user.achievements_fetched_at.to_s + " " + last_at.to_s;
    #return;

    if current_user.achievements_fetched_at > last_at
      render :partial => 'user/achievements', :locals => {user: current_user}
    else
      render :text => '';
    end
  end


end
