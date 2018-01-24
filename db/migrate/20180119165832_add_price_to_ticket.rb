class AddPriceToTicket < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :active, :boolean
  end
end
