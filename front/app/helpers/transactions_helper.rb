module TransactionsHelper
  def link_to_add_transaction(name)
    new_object = Transaction.new
    id = new_object.object_id
    fields = fields_for("transactions[]", new_object, index: id) do |builder|
      render "transaction_fields", f: builder, index: id
    end
    link_to(name, '#', class: "add_fields btn", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
