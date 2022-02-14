class RenameColumnsToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :startdate, :start_date
    rename_column :posts, :enddate, :end_date
  end
end