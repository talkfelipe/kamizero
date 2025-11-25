class NoticesController < ApplicationController
  def show
    @notice = Notice.find(params[:id])
  end

  def index
    @notices = Notice.all

    category = params.dig(:filters, :category)
    if category.present?
      @notices = @notices.where(category: category)
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
