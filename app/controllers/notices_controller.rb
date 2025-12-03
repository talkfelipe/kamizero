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
      notification: notice
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
      @notices = current_user.teacher_notices.not_templates
    else
      @notices = current_user.parent_notices.not_templates
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

    @notices = @notices.order(created_at: :desc)

  end

  def scan_file
    text = params[:text]

    if text.blank?
      render json: { error: "No text provided" }, status: :unprocessable_entity
      return
    end

    begin
      raw_json = Notice.extract_title_and_content(text)
      hash_data = JSON.parse(raw_json)

      if hash_data["title"].blank? || hash_data["content"].blank?
        render json: { error: "Could not extract title and content" }, status: :unprocessable_entity
        return
      end

      @notice = Notice.new(
        title: hash_data["title"],
        content: hash_data["content"]
      )
    rescue JSON::ParserError => e
      Rails.logger.error("Failed to parse LLM response: #{e.message}")
      render json: { error: "Failed to process document" }, status: :unprocessable_entity
    end
  end

  def events
    date = params[:start_date].present? ? Date.parse(params[:start_date]) : Date.today
    # Start and end of the visible month
    start_of_month = date.beginning_of_month
    end_of_month   = date.end_of_month
    if current_user.role == "teacher"
      @events = current_user.teacher_notices.not_templates.where(category: "Event").where(date: start_of_month..end_of_month).order(:date, :start_time)
    else
      @events = current_user.parent_notices.not_templates.where(category: "Event").where(date: start_of_month..end_of_month).order(:date, :start_time)
    end
    @events_for_day = @events.group_by(&:date)
  end

  def new
    @notice = Notice.new
    @school = current_user.school
    @templates = Notice.templates.where(school: @school)
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
    params.require(:notice).permit(:title, :category, :date, :start_time, :end_time, :content, :classroom_id, :attachment)
  end
end
