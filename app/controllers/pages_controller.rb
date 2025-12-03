class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    date = params[:start_date].present? ? Date.parse(params[:start_date]) : Date.today
    # Start and end of the visible month
    start_of_month = date.beginning_of_month
    end_of_month   = date.end_of_month

    if current_user.role == "teacher"  #when user role is teacher
      notice_scope = current_user.teacher_notices
      note_scope = current_user.notes
      @events = notice_scope
                  .where(category: "Event", date: start_of_month..end_of_month)
                  .order(:date, :start_time)
                  .distinct
    else
      notice_scope = current_user.parent_notices
      note_scope = current_user.children_notes
      @events = notice_scope
                  .where(category: "Event", date: start_of_month..end_of_month)
                  .order(:date, :start_time)
                  .distinct
    end

    # ----- GET the ID of READ Items -------
    read_notice_ids = current_user.read_notifications     # distinguish notice which status is true
                            .where(status: true, notification_type: "Notice")
                            .pluck(:notification_id)
    read_note_ids = current_user.read_notifications
                            .where(status: true, notification_type: "Note")
                            .pluck(:notification_id)

    # ----- SHOW only Notice/Notes with OUT ID of Read Items -----
    @unread_notices = notice_scope                   # take out only unread_notices which status is true
                      .where.not(id: read_notice_ids)
                      .order(created_at: :desc)
                      .limit(10)

    @unread_notes = note_scope
                      .where.not(id: read_note_ids)
                      .order(created_at: :desc)
                      .limit(10)

    @unread_count_notices  = @unread_notices.size
    @unread_count_notes  = @unread_notes.size

    @events_for_day = @events.group_by(&:date)

  end
end
