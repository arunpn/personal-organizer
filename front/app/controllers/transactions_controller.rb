class TransactionsController < ApplicationController
  before_filter :account
  before_filter :accounts
  before_filter :authenticate_user!

  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transactions = (1..5).map { @account.transactions.build }
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def create
    # binding.pry
    @transactions = []
    params[:transactions].each_value do |transaction_params|
      transaction = @account.transactions.build(transaction_params)
      unless transaction.save
        @transactions << transaction
      end
    end
    redirect_to @account, notice: 'Transaction was successfully created.'
  end

  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update_attributes(params[:transaction])
      redirect_to @transaction, notice: 'Transaction was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to transactions_url
  end

private

  def account
    @account = Account.find(params[:account_id])
  end
  
  def accounts
    @accounts = Account.all
  end
  
end
