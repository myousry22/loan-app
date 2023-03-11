class Loan < ApplicationRecord
  ANNUAL_INEREST_RATE = 0.20.freeze
  belongs_to :customer

  validates :number_of_installments, inclusion: { in: 1..6 }


  validates :number_of_installments, :amount, presence: true 


  before_create :add_loan_interest


  def total_amount
    ( amount + interest )
  end

  def installment_schedule
    monthly_amount = monthly_installment_amount
    start_date = created_at
    installments = []
    (1..number_of_installments).each do |num|
      installment_date = start_date + (num-1).months
      installment_amount = monthly_amount
      installments << { date: installment_date, amount: installment_amount }
    end
    installments
  end
  

  private 

  def add_loan_interest
    interest_rate = (number_of_installments/12.0) * ANNUAL_INEREST_RATE
    self.interest = amount * interest_rate 
  end

  def monthly_installment_amount
    total_amount / number_of_installments
  end
  
end
