class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    if current_user.role == "teacher"
      @events = current_user.school.notices.where(category: "Event")
    else
      @events = current_user.notices.where(category: "Event")
    end
    @events_for_day = @events.group_by(&:date)
  end
end
