class AddForadultToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :foradult, :boolean
  end
end
