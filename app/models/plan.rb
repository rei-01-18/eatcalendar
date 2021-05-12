class Plan < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :meal
  has_many :likes, dependent: :destroy

  with_options presence: true do
    validates :plan
    validates :date
  end
  validates :meal_id, numericality: { other_than: 1 } 
end
