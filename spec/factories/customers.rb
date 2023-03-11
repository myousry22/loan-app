# frozen_string_literal: true

FactoryBot.define do
    factory :customer do
      name { 'customer' }
      user_id { 1 }
      yearly_income { 10000 }
    end
  end
  