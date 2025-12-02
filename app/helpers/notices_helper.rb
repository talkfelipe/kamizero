module NoticesHelper
  require "erb"
  include ERB::Util

  def google_calendar_url_for(notice)
    title = notice.title
    date = notice.date
    start_time = notice.start_time
    end_time = notice.end_time || (notice.start_time + 1.hour)
    details = notice.content

    # DateTime.new(year, month, day, hour, min, sec)
    start_datetime = DateTime.new(date.year, date.month, date.day, start_time.hour, start_time.min, start_time.sec, '+09:00')
    end_datetime = DateTime.new(date.year, date.month, date.day, end_time.hour, end_time.min, end_time.sec, '+09:00')

    start_str = start_datetime.utc.strftime("%Y%m%dT%H%M%SZ")
    end_str   = end_datetime.utc.strftime("%Y%m%dT%H%M%SZ")

    params = {
      action: "TEMPLATE",
      text: title,
      dates: "#{start_str}/#{end_str}",
      details: details,
    }

    query = params.map { |k, v| "#{k}=#{url_encode(v.to_s)}"}.join("&")

    "https://calendar.google.com/calendar/render?#{query}"

  end
end
