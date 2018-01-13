class AddPriceToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :price_low, :decimal
    add_column :events, :price_high, :decimal
  end
end
