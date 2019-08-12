class Event < ApplicationRecord
  validates :title, length: { in: 5..140, message: "must be between 5 and 140 charachters" }
  validates :start_date, presence:true
  validates :duration, presence:true, numericality: { only_integer: true, greater_than: 0 }, if: :modulo5?
  validates :price, presence:true, numericality: { only_integer: true, greater_than: 0, less_than: 1000 }
  validates :location, presence:true
  validates :description, presence:true, length: { in: 20..1000, message: "must be between 20 and 1000 charachters" }
  
  belongs_to :administrator, class_name: "User"
  has_many :attendances
  has_many :users, through: :attendances

  def modulo5?
    duration/5==Integer
  end
end
