class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :name, :artist
    rename_column :events, :date, :event_date
  end
end
