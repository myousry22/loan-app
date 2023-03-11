# frozen_string_literal: true

FactoryBot.define do
    factory :loan do
      amount { 100000 }
      customer
      number_of_installments { 6 }
    end
end
  