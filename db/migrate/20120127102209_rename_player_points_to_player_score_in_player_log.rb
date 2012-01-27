class RenamePlayerPointsToPlayerScoreInPlayerLog < ActiveRecord::Migration
  def change
	rename_column :player_logs, :points, :score
  end
end
