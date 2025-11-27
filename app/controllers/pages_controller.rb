class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    if current_user.role == "teacher"
      @events = current_user.school.notices.where(category: "Event")

      base_scope = current_user.school.notices       # teacher can see every notices
      read_ids = current_user.read_notifications     # distinguish notice which status is true
                             .where(status: true)
                             .select(:notice_id)

      @unread_notices = base_scope                   # take out only unread_notices which status is true
                        .where.not(id: read_ids)
                        .order(created_at: :desc)
      @unread_count   = @unread_notices.size

    else
      @events = current_user.notices.where(category: "Event")

      base_scope = Notice.none #none
      current_user.subscriptions.each do |subs|      #creating subscription data to put it into base_scope
        scope_for_sub =
          subs.school.notices.where(
            grade: [subs.grade, "All"],
            classroom: [subs.classroom, "All"]
          )
        base_scope = base_scope.or(scope_for_sub)   #.or will add up subscription into base_scope
      end

      base_scope = base_scope.distinct              # eliminating same data ex: all grade for two children needs to be only one

      read_ids = current_user.read_notifications    # distinguish notice which status is true
                             .where(status: true)
                             .select(:notice_id)

      @unread_notices = base_scope                  # take out only unread_notices which status is true
                        .where.not(id: read_ids)
                        .order(created_at: :desc)
      @unread_count   = @unread_notices.size
    end
    @events_for_day = @events.group_by(&:date)
  end
end
