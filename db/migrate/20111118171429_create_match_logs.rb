class CreateMatchLogs < ActiveRecord::Migration
  def change
    create_table :match_logs do |t|
      t.integer :match_id
      t.text :msg

      t.timestamps
    end
  end
end
