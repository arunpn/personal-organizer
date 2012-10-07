class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :accounts

  def after_sign_in_path_for(resource)
    accounts_path
  end

private

  def accounts
    @accounts = if current_user
      current_user.accounts.select(&:valid?)
    else
      []
    end
  end

end