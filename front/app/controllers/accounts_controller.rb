class AccountsController < ApplicationController
  def index
  end

  def new
    @account = Account.new
  end

  def create
    redirect_to action: :index
  end
end
