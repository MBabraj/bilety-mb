class ChangeBirthdayName < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :birthdate, :birth_date
  end
end
