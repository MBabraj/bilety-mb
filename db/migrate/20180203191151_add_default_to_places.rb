class AddDefaultToPlaces < ActiveRecord::Migration[5.1]
  def up
    change_column :tickets, :places, :integer, default: 0
  end
  def down
    change_column :tickets, :places, :integer, default: nil
  end
end
