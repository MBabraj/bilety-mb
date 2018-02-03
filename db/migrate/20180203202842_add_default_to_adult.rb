class AddDefaultToAdult < ActiveRecord::Migration[5.1]
  def up
    change_column :events, :for_adult, :boolean, default: false
  end
  def down
    change_column :events, :for_adult, :boolean, default: nil
  end
end
