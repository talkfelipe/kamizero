class NoticesController < ApplicationController
  def show
    @notice = Notice.find(params[:id])
  end

  def index
    @notices = Notice.all
  end

end
