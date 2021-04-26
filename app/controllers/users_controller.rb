class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @plans = current_user.plans
  end
end
