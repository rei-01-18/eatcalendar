class Plan < ApplicationRecord

  belongs_to :user

  
  validates :plan, presence: true
  validates :date, presence: true
end
