module ApplicationHelper
  FLASH_CLASSES = {
    success: "success", notice: "info", info: "info", error: "danger",
    alert: "danger"
  }

  def flash_messages
    flash.collect do |key, msg|
      content_tag :p, class: "alert alert-#{FLASH_CLASSES[key.to_sym]}" do
        content_tag(:a, "x",
          class: "close", href: "#", data: { dismiss: "alert" }) + msg
      end
    end.join.html_safe
  end

  def page_title(title)
    content_for(:page_title) { title }
  end

  def link_to_edit(path, title)
    link_to path, title: title do
      content_tag(:i, "", class: "fa fa-pencil")
    end
  end

  def link_to_destroy(path, confirm_message, title)
    link_to(path, method: :delete, title: title, data:
      { confirm: confirm_message }) do
      content_tag(:i, "", class: "fa fa-trash-o")
    end
  end
end
