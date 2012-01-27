class AddPlayerStandingToPlayerLog < ActiveRecord::Migration
  def change
    add_column :player_logs, :standing, :integer
  end
end
