class ChangeNames < ActiveRecord::Migration
  def change
    rename_column :table, :bands, :band
  end
end
