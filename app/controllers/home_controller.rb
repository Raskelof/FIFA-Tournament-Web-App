class HomeController < ApplicationController
  def index
    @teams = Team.all.select{|t| t.players.length > 1}.sort_by{|t| t.points_per_game}.reverse
    @match_logs = MatchLog.order("created_at DESC").first(10)
  end

end
