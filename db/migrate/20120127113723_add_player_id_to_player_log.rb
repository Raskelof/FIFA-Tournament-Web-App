class AddPlayerIdToPlayerLog < ActiveRecord::Migration
  def change
	add_column :player_logs, :player_id, :integer
  end
end
