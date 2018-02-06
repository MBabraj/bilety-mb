class AddTicketReferenceToEvent < ActiveRecord::Migration[5.1]
  def change
    add_reference :tickets, :events, foreign_key: true
  end
end
