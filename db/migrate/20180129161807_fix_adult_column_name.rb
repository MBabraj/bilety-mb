class FixAdultColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :foradult, :for_adult
  end
end
