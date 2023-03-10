json.extract! loan, :id, :amount, :number_of_installments, :customer_id, :created_at, :updated_at
json.url loan_url(loan, format: :json)
