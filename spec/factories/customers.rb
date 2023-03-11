# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    name { 'customer' }
    user
    yearly_income { 10_000 }
  end
end
