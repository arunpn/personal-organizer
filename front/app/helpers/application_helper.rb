module ApplicationHelper
  def confirmation_delete_link(object, url, modal_title, modal_content)
    modal_id = "delete_#{object.class.to_s.downcase}_#{object.id}"
    render 'delete_confirmation', object: object, url: url, modal_id: modal_id, modal_title: modal_title, modal_content: modal_content
  end
end
