FIFA::Application.routes.draw do

	# staticstics
  match '/statistics/league_player_points', :controller => 'statistics', :action => 'league_player_points'
  match '/statistics/league_double_team_standings', :controller => 'statistics', :action => 'league_double_team_standings'
  match '/statistics/league_single_team_standings', :controller => 'statistics', :action => 'league_single_team_standings'

  resources :statistics

  resources :matches
  resources :teams
  
  # players
  match '/players/:id/ranking-over-time', :controller => 'players', :action => 'ranking_over_time'
  match '/players/:id/pie-chart', :controller => 'players', :action => 'pie_chart'
  match '/players/:id/matches', :controller => 'players', :action => 'matches'
  resources :players

  get "home/index"
  root :to => 'home#index'
end
