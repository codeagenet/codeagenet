class InformersCell < Cell::Rails

  def recent
    @recent_achievements = Achievement.recent
    render
  end

  def top
    @tops = Achievement.top_users
    render
  end

end
