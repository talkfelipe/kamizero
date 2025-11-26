class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @user = current_user
    @subscription.user = @user
    if @subscription.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:school_id, :grade, :classroom)
  end
end
