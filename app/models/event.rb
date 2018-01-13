class Event < ApplicationRecord
  belongs_to :user
  has_many :tickets

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :artist, presence:  true
  validates :price_low, presence: true
  validates :price_high, presence: true
  validates :event_date, presence: true



end
