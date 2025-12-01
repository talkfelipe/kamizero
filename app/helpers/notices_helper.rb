module NoticesHelper
  require "erb"
  include ERB::Util

  def google_calendar_url_for(notice)
    title = notice.title
    date = notice.date
    start_time = notice.start_time
    end_time = notice.end_time || (notice.start_time + 1.hour)
    details = notice.content

    start_dt = Time.zone.local(
      date.year, date.month, date.day, start_time.hour-9, start_time.min, start_time.sec)
    end_dt = Time.zone.local(
      date.year, date.month, date.day, end_time.hour-9, end_time.min, end_time.sec)

    start_str = start_dt.utc.strftime("%Y%m%dT%H%M%SZ")
    end_str   = end_dt.utc.strftime("%Y%m%dT%H%M%SZ")

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
