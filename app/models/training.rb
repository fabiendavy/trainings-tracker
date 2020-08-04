class Training < ApplicationRecord
  belongs_to :user

  SPORTS = %w(Swim Bike Run Gym)

  validates :sport, presence: true, inclusion: { in: SPORTS } 
  validates :distance, presence: true
  validates :time, presence: true, format: { with: /\A(\d{2})\:([0-5][0-9])\:([0-5][0-9])\z/ }
end
