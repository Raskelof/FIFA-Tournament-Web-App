FIFA::Application.routes.draw do

  match '/statistics/league_player_points', :controller => 'statistics', :action => 'league_player_points'
  match '/statistics/league_double_team_standings', :controller => 'statistics', :action => 'league_double_team_standings'
  match '/statistics/league_single_team_standings', :controller => 'statistics', :action => 'league_single_team_standings'

  resources :statistics

  resources :matches
  resources :teams
  resources :players

  get "home/index"
  root :to => 'home#index'
end
