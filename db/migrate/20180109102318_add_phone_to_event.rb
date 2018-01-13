class AddPhoneToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :phone, :string
  end
end
