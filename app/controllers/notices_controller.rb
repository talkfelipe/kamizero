class NoticesController < ApplicationController
  def show
    @notice = Notice.find(params[:id])
    ReadNotification.create(user: current_user, notice: @notice, status: true)
  end

  def index
    #teacher can see all the notices of the school
    if current_user.role == "teacher"
      base_scope = current_user.school.notices
    else
    #parents can see only notices of subscribed items
      base_scope = Notice.none #none

      #creating subscription data to put it into base_scope
      current_user.subscriptions.each do |subs|
        scope_for_sub =
          subs.school.notices.where(
            grade: [subs.grade, "All"],
            classroom: [subs.classroom, "All"]
          )
        base_scope = base_scope.or(scope_for_sub)
        #.or will add up subscription into base_scope
      end

      # eliminating same data ex: all grade for two children needs to be only one
      base_scope = base_scope.distinct
    end

    # get the parameters of filters
    filters = params[:filters] || {}
    query = filters[:q]
    category = filters[:category]

    # without the filter
    scoped = base_scope

    # if query exist, we will use the query
    if query.present?
      scoped = scoped.search_by_filters(query)
    end

    # if category exist, we will use the category
    if category.present?
      scoped = scoped.where(category: category)
    end

    @notices = scoped
  end

  def scan_file
    text = params[:text]
    hash_data = Notice.extract_title_and_content(text)
    # TODO get info from image
    @notice = Notice.new(
      title: hash_data["title"],
      content: hash_data["content"]
    )
  end

  def events
    if current_user.role == "teacher"
      @events = current_user.school.notices.where(category: "Event")
    else
      @events = current_user.notices.where(category: "Event")
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
