# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Loan, type: :model do
  it { should belong_to(:customer) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:number_of_installments) }

  #   subject { Loan.new(number_of_installments: 1, amount: 22222, customer_id: 1) }
  it { should validate_inclusion_of(:number_of_installments).in?(1..6) }

  describe '.add_loan_interest' do
    let(:loan) { create(:loan) }

    it 'should calc and add loan interest' do
      expect(loan.interest).not_to eql(nil)
    end
  end
end
