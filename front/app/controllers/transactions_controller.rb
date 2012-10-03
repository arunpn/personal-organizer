class TransactionsController < ApplicationController
  before_filter :account
  before_filter :accounts
  before_filter :authenticate_user!

  def new
    @transactions = (1..5).map { @account.transactions.build }
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def create
    @transactions = @account.bulk_create(params[:transactions], params[:creation_date])
    if @transactions.empty?
      redirect_to @account, notice: 'Transaction was successfully created.'
    else
      render action: :new
    end
  end

  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update_attributes(params[:transaction])
      redirect_to @account, notice: 'Transaction was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to @account, notice: "Transaction was successfully destroyed."
  end

private

  def account
    @account = Account.find(params[:account_id])
  end
  
  def accounts
    @accounts = Account.all
  end
  
end
