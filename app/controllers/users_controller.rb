class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @plans = Plan.where(user_id: current_user.id)
    @plan = Plan.find_by(params[:plan_id])
    @like = Like.new
  end

end