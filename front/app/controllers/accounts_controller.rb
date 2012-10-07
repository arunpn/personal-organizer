class AccountsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @transactions = current_user.transactions.page(params[:page])
  end

  def show
    @account = Account.find(params[:id])
    @transactions = @account.transactions.page(params[:page])
  end

  def new
    @account = current_user.accounts.build
  end

  def create
    @account = current_user.accounts.build(params[:account])
    if @account.save
      flash[:notice] = "Account successfully created"
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(params[:account])
      flash[:notice] = "Account updated successfully"
      redirect_to accounts_path
    else
      render :edit
    end
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    flash[:notice] = "Account successfully destroyed."
    redirect_to accounts_path
  end
  
end