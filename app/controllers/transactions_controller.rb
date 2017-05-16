class TransactionsController < ApplicationController

  def new
    @transaction = Transaction.new
  end

  def create
    # add new money from outside
    @transaction = Transaction.new(transaction_params)
    a = params[:transaction][:amount].to_i
    from = params[:transaction][:from_id]
    to = params[:transaction][:to_id]
    account_from = Account.find_by(user_id: from, meta_name: 'withdrawal')
    account_to = Account.find_by(user_id: to, meta_name: 'deposit')
    account_to.increment!('balance', a)
    account_from.decrement!('balance', a)
    @transaction.assign_attributes(:type_transfer => 'true')
    @transaction.assign_attributes(:from_id => account_from.id)
    @transaction.assign_attributes(:to_id => account_to.id)
    #puts(@transaction)
    respond_to do |format|
      if @transaction.save!
        format.html { redirect_to @transaction, notice: 'Transaction was successfully processed.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end
  private

  # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:amount, :type_deposit, :type_withdrawal, :type_transfer, :type_fee, :to_id, :from_id)
    end
end
