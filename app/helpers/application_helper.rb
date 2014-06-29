module ApplicationHelper

  def notice_block
    return unless notice
    content_tag :p, notice
  end

end
