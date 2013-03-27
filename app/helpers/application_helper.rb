module ApplicationHelper

  def error_messages(model)
    flash_messages = []
    model.errors.full_messages.each do |message|
      text = content_tag(:div,
                         content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") +
                         message.html_safe, :class => "alert fade in alert-error")
      flash_messages << text if message
    end
    flash_messages.join("\n").html_safe
  end

  def format_time(time)
    time.strftime('%d/%m/%Y') if time.present?
  end

end
