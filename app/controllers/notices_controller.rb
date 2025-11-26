class NoticesController < ApplicationController
  def show
    @notice = Notice.find(params[:id])
    ReadNotification.new(user: current_user, notice: @notice, status: true)
  end

  def index
    if current_user.role == "teacher"
      @notices = current_user.school.notices
    else
      @notices = current_user.subscriptions.map do |subs|
        subs.school.notices.where(grade: [subs.grade, "All"], classroom: [subs.classroom, "All"])
      end.flatten.uniq
    end

    category = params.dig(:filters, :category)

    if category.present?
      @category_filtered_notices = @notices.select { |notice|notice.category == category }
    else
      @category_filtered_notices = @notices
    end
  end

  def events
    @events = Notice.where(category: "Event")
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
    params.require(:notice).permit(:title, :category, :date, :content, :grade, :classroom, :attachment, :school)
  end
end
