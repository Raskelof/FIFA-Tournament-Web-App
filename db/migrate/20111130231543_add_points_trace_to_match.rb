class AddPointsTraceToMatch < ActiveRecord::Migration
  def change
  	add_column :matches, :points_trace, :text
  end
end
