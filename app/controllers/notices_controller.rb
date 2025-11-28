class NoticesController < ApplicationController
  def show
    @notice = Notice.find(params[:id])

  end

  def mark_as_read
    notice = Notice.find(params[:id])
    # For those who read the show page will change the status to true.
    # Used find_or_initialize_by in order to avoid having multiple action of
    # status = true by looking at same show page several times
    read = ReadNotification.find_or_initialize_by(
      user: current_user,
      notice: notice
    )
    read.status = true
    read.save!

    respond_to do |format|
      format.json { head :no_content }
      format.html { redirect_to notice_path(notice) } # 念のため
    end

  end

  def index
    #teacher can see all the notices of the school
    if current_user.role == "teacher"
      @notices = current_user.school.notices
    else
      grades = current_user.subscriptions.pluck(:grade) + ["All"]
      classrooms = current_user.subscriptions.pluck(:classroom) + ["All"]
      @notices = Notice.includes(school: [:notices,:subscriptions])
        .where(school: {
          subscriptions: { user: current_user }
          },
          grade: grades,
          classroom: classrooms
        )
    end

    # get the parameters of filters
    filters = params[:filters] || {}
    query = filters[:q]
    category = filters[:category]
    school_id = filters[:school_id]

    if school_id.present?
      @notices = @notices.where(school_id: school_id)
    end

    # if query exist, we will use the query
    if query.present?
      @notices = @notices.search_by_filters(query)
    end

    # if category exist, we will use the category
    if category.present?
      @notices = @notices.where(category: category)
    end
  end

  def scan_file
    text = params[:text]
    hash_data = JSON.parse(Notice.extract_title_and_content(text))

    # TODO get info from image
    @notice = Notice.new(
      title: hash_data["title"],
      content: hash_data["content"]
    )
  end

  def events
    date = params[:start_date].present? ? Date.parse(params[:start_date]) : Date.today
    # Start and end of the visible month
    start_of_month = date.beginning_of_month
    end_of_month   = date.end_of_month
    if current_user.role == "teacher"
      @events = current_user.school.notices.where(category: "Event").where(date: start_of_month..end_of_month).order(:date, :start_time)
    else
      @events = current_user.notices.where(category: "Event").where(date: start_of_month..end_of_month).order(:date, :start_time)
    end
    @events_for_day = @events.group_by(&:date)
  end

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params)
    @notice.school = current_user.school
    if @notice.save
      redirect_to notice_path(@notice)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def notice_params
    params.require(:notice).permit(:title, :category, :date, :start_time, :end_time, :content, :grade, :classroom, :attachment, :school)
  end
end
