# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def current_user
    controller.send(:current_user)
  end

  def show_flash_messages
    return "" unless flash.keys.any?
    ret = "<div id='flash-messages'>"
    flash.each do |key, message|
      ret << "<div class=\"flash flash-#{key}\"> #{message} </div>"
    end
    ret << "</div>"
  end
end
