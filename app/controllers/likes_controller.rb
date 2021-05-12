class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(plan_id: params[:plan_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @plan = Plan.find(params[:plan_id])
    @like = current_user.likes.find_by(plan_id: @plan.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
