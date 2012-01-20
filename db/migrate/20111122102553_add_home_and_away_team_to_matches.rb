class AddHomeAndAwayTeamToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :home_team_id, :integer
    add_column :matches, :away_team_id, :integer
  end
end
