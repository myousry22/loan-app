# frozen_string_literal: true

class Customer < ApplicationRecord
  belongs_to :user
  has_many :loans, dependent: :destroy

  validates :name, :yearly_income, presence: true
end
