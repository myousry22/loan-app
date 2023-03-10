class LoansController < ApplicationController
  before_action :set_customer
  before_action :set_loan, only: %i[ show edit update destroy installment_schedule]

  # GET /loans or /loans.json
  def index
    @loans = Loan.all
  end

  # GET /loans/1 or /loans/1.json
  def show
  end

  # GET /loans/new
  def new
    @loan = @customer.loans.build
  end

  # GET /loans/1/edit
  def edit
  end

  # POST /loans or /loans.json
  def create
    @loan = @customer.loans.build(loan_params)

    respond_to do |format|
      if @loan.save
        format.html { redirect_to customer_loan_path(@customer, @loan), notice: 'Loan was successfully created.' }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loans/1 or /loans/1.json
  def update
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to customer_loan_path(@customer, @loan), notice: "Loan was successfully updated." }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1 or /loans/1.json
  def destroy
    @loan.destroy

    respond_to do |format|
      format.html { redirect_to customer_loans_path(@customer), notice: "Loan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def installment_schedule 
    @installment_schedule = @loan.installment_schedule
    @installment_schedule
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_customer
      @customer = Customer.find(params[:customer_id])
    end
  
    def set_loan
      @loan = @customer.loans.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loan_params
      params.require(:loan).permit(:amount, :number_of_installments, :duration).merge(customer_id: @customer.id)
    end
end
