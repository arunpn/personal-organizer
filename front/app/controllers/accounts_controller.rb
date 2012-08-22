class AccountsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :accounts
  
  def index
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(params[:account])
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

private

  def accounts
    @accounts = Account.all
  end
  
end
