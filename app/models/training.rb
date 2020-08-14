class Training < ApplicationRecord
  belongs_to :user

  SPORTS = %w(Swim Bike Run Gym)

  validates :sport, presence: true, inclusion: { in: SPORTS } 
  validates :date, presence: true
  validates :distance, presence: true
  validates :time, presence: true, format: { with: /\A(\d{2})\:([0-5][0-9])\:([0-5][0-9])\z/ }

  def incorrect_swim_unit?
    return true if sport == 'Swim' && /(\d{3,})/.match(distance.to_s)
    return false
  end

  def convert_swim_meters_in_kms
    distance.fdiv(1000)
  end
end
