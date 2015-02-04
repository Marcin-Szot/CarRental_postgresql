class Car < ActiveRecord::Base
  has_many :slots, dependent: :destroy

  validates :name, presence: true
  validates :category, inclusion: {in: %w(A B C), message: "can only be of type A, B or C"}
  validates :description, presence: true
end
