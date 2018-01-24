class Event < ApplicationRecord
  has_many :tickets

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :artist, presence:  true
  validates :price_low, presence: true
  validates :price_high, presence: true
  validates :event_date, presence: true
  # validates :foradult, present: true

  validate :event_date_not_in_past

  def event_date_not_in_past
    if event_date.present? && event_date <= Date.today
      errors.add(:event_date, " needs to be in the future")
    end
  end

  validates :price_low,
            :numericality => true,
            :format => { :with => /\A\d{1,4}(\.\d{0,2})?\Z/ }

  validates :price_high,
            :numericality => true,
            :format => { :with => /\A\d{1,4}(\.\d{0,2})?\Z/ }



end
