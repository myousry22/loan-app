class Customer < ApplicationRecord
  belongs_to :user
  has_many :loans

  validates :name, :yearly_income, presence: true 
end
