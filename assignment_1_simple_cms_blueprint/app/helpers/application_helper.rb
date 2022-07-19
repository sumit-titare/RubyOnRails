module ApplicationHelper

  def show_error_message object
    render(partial: 'application/name_error', locals: { object: object })
  end
end
