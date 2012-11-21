module TransactionsHelper
  def link_to_add_transaction(name)
    new_object = Transaction.new
    id = new_object.object_id
    fields = fields_for("transactions[]", new_object, index: id) do |builder|
      render "transaction_fields", f: builder, index: id
    end
    link_to(name, '#', class: "add_fields btn", data: {id: id, fields: fields.gsub("\n", "")})
  end
  
  def edit_transaction_link(transaction, account = transaction.account)
		link_to edit_account_transaction_path(account, transaction), title: 'edit' do
      content_tag(:i, '', class: 'icon-pencil')
    end
  end
  
  def delete_transaction_link(transaction, account = transaction.account)
    confirmation_delete_link transaction, account_transaction_path(account, transaction), "Deleting Transaction", "Are you sure to delete this transaction?" do
      content_tag(:i, '', class: 'icon-trash')
    end
  end
end