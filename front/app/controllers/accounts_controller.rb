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

private

  def accounts
    @accounts = Account.all
  end
  
end
