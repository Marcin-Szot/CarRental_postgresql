class Slot < ActiveRecord::Base
  belongs_to :car

  validates :startdate, presence: true
  validates :enddate, presence: true
end
