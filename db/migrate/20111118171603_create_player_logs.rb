class CreatePlayerLogs < ActiveRecord::Migration
  def change
    create_table :player_logs do |t|
      t.integer :player_id
      t.text :msg
      t.integer :points

      t.timestamps
    end
  end
end
