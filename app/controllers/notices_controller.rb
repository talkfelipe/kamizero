class NoticesController < ApplicationController
  def show
    @notice = Notice.find(params[:id])
    ReadNotification.new(user: current_user, notice: @notice, status: true)
  end

  def index
    if current_user.role == "teacher"
      @notices = current_user.school.notices
    else
      @notices = current_user.notices
    end

    category = params.dig(:filters, :category)

    if category.present?
      @category_filtered_notices = @notices.select { |notice|notice.category == category }
    else
      @category_filtered_notices = @notices
    end
  end

  def events
    if current_user.role == "teacher"
      @events = current_user.school.notices.where(category: "Event")
    else
      @events = current_user.notices.where(category: "Event")
    end
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
