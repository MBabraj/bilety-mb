class Ticket < ApplicationRecord

  default_scope { where(active: true)}

  belongs_to :user
  belongs_to :event

  #validates :name, :presence => true # :length => { :minimum => 6 }
  # validates :email_address, :presence => true
  #validates :price, :presence => true

end
