class ChangeOverviewToBeTextInMovie < ActiveRecord::Migration[7.1]
  def change
    change_column :movies, :overview, :text
  end
end
