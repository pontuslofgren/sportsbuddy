module ApplicationHelper
  def format_date_time(date)
    date.strftime('%a %d of %b at %H:%M')
  end
end
