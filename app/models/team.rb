class Team < ActiveRecord::Base
  has_and_belongs_to_many :players
  has_many :home_matches, :class_name => "Match", :foreign_key => "home_team_id"
  has_many :away_matches, :class_name => "Match", :foreign_key => "away_team_id"



  attr_accessor :player_list
  after_save :update_players

  def display_name
    players.map{|p| p.username}.join(" & ")
  end

  def matches
  	home_matches + away_matches
  end

  def wins
     Match.find(:all, :conditions => "home_team_id =  #{id} AND home_score > away_score").count + Match.find(:all, :conditions => "away_team_id =  #{id} AND away_score > home_score").count
  end

  def losses
    Match.find(:all, :conditions => "home_team_id =  #{id} AND home_score < away_score").count + Match.find(:all, :conditions => "away_team_id =  #{id} AND away_score < home_score").count
  end

  def draws
	Match.find(:all, :conditions => "home_team_id =  #{id} AND home_score = away_score").count + Match.find(:all, :conditions => "away_team_id =  #{id} AND away_score = home_score").count
  end

  def points
    (wins * 3) + (draws * 1)
  end

  def points_per_game
    matchcount = matches.length
    if(matches.count < 1)
			matchcount = 1
    end

    (((wins * 3) + (draws * 1)).to_f / matchcount.to_f).to_f.round 1
  end

  private
  def update_players
    selected_players = player_list.nil? ? [] : player_list.keys.collect{|id| Player.find_by_id(id)}
    selected_players.each {|player| self.players << player}
  end
end
