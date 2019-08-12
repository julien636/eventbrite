class User < ApplicationRecord
  
  # validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  # validates :description, presence: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  has_many :attendances
  has_many :events, through: :attendances
  has_many :event_admin, foreign_key: 'administrator_id', class_name: "Event"
end
