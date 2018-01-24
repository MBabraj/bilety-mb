class AddPlacesToTicket < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :places, :integer
  end
end
