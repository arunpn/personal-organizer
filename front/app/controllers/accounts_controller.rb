class AccountsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @transactions = current_user.transactions.page(params[:page])
  end

  def show
    @account = Account.find_by_user!(params[:id], current_user)
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
    @account = Account.find_by_user!(params[:id], current_user)
  end

  def update
    @account = Account.find_by_user!(params[:id], current_user)
    if @account.update_attributes(params[:account])
      flash[:notice] = "Account updated successfully"
      redirect_to accounts_path
    else
      render :edit
    end
  end

  def destroy
    @account = Account.find_by_user!(params[:id], current_user)
    @account.destroy
    flash[:notice] = "Account successfully destroyed."
    redirect_to accounts_path
  end
  
end