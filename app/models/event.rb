class Event < ApplicationRecord
  belongs_to :administrator, class_name: "User"
  has_many :attendances
  has_many :users, through: :attendances
  
  validates :title, length: { in: 5..140, message: "must be between 5 and 140 charachters" }
  validates :start_date, presence:true
  validates :duration, presence:true, numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence:true, numericality: { only_integer: true, greater_than: 0, less_than: 1000 }
  validates :location, presence:true
  validates :description, presence:true, length: { in: 20..1000, message: "must be between 20 and 1000 charachters" }
  validates :modulo5?, presence:true
  validates :already_past?, presence:true
  validates :modulo5?, presence:true
  


  private

  def modulo5?
    duration % 5 == 0 ? true : errors.add(:duration, "must be a five multiple")
  end

  def already_past?
    if start_date < Time.now
      errors.add(:start_date, " already past")
    else
      true
    end 
  
  end
end
