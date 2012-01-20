class CreateTeamToPlayers < ActiveRecord::Migration
def change	
    create_table :players_teams, :id => false do |t|
	  t.references :team, :player
    end
  end
end
