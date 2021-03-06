class UserController < ApplicationController
  protect_from_forgery
  before_filter :authenticate_user!, :only => [:profile, :force_earn]

  def public
    username = request.params[:username]
    @user = User.find_by_nickname! username
  end

  def force_earn
    current_user.async_earn_achievements
    render :json => {last_at: current_user.achievements_fetched_at};
  end

  def poll_achievements
    last_at = params[:last_at].empty? ? 0 : Time.parse( params[:last_at] )

    if current_user.achievements_fetched_at.to_i > last_at.to_i
      render :partial => 'user/achievements', :locals => {user: current_user}
    else
      render :text => '';
    end
  end
end
