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
end
