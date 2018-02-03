class SetDefaultsToEvent < ActiveRecord::Migration[5.1]
  def up
    change_column :events, :size, :integer, default: 0
    change_column :events, :price_low, :decimal, default: 0
    change_column :events, :price_high, :decimal, default: 0
  end

  def down
    change_column :events, :size, :integer, default: nil
    change_column :events, :price_low, :decimal, default: nil
    change_column :events, :price_high, :decimal, default: nil
  end
end
