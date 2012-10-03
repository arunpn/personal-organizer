module AccountsHelper
  def accounts_total
    @acounts_total ||= @accounts.collect(&:current_balance).inject(:+)
  end
  
  def edit_account_link(account)
    link_to edit_account_path(account), title: 'edit' do
      content_tag(:i, '', class: 'icon-pencil')
		end
  end
  
  def delete_account_link(account)
		confirmation_delete_link account, account_path(account), "Are you sure to delete the account?", "Your account and all its transactions will be lost forever." do
      content_tag(:i, '', class: 'icon-trash')
		end
  end
end