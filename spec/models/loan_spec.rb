require "rails_helper" 

RSpec.describe Loan, type: :model do
 
  it { should belong_to(:customer) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:number_of_installments) }
    
#   subject { Loan.new(number_of_installments: 1, amount: 22222, customer_id: 1) }
  it { should validate_inclusion_of(:number_of_installments).in?(1..6) }

end
