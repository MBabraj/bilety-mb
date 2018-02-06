class AddTakenToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :taken, :string, default: 0
  end
end
