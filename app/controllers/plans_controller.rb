class PlansController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_plan, only: [:edit, :update, :destroy]

  def index
    get_week
    @plan = Plan.new
  end

  def create
    Plan.create(plan_params)
    redirect_to action: :index
  end

  def destroy
    @plan.destroy
    redirect_to user_path(current_user.id)
  end

  def edit
  end

  def update
    if @plan.update(plan_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def men
  end

  def women
  end

  private

  def plan_params
    params.require(:plan).permit(:date, :plan, :meal_id).merge(user_id: current_user.id)
  end

  def get_week
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']
  
    @todays_date = Date.today
    @week_days = []

    plans = Plan.where(date: @todays_date..@todays_date + 6)
   
    7.times do |x|    
      today_plans = []
      plans.each do |plan|
        today_plans.push(plan.plan) if plan.date == @todays_date + x
      end
      today_meals = []
      plans.each do |plan|
        today_meals.push(plan.meal.name) if plan.date == @todays_date + x
      end


      wday_num = Date.today.wday + x
  
      if wday_num >= 7
        wday_num = wday_num -7
      end

      days = { month: (@todays_date + x).month, date: (@todays_date + x).day, plans: today_plans, meals: today_meals, wday: wdays[wday_num] }
      @week_days.push(days)
    end
  end

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def ensure_correct_user
    unless @item.user == current_user
      redirect_to root_path
    end
  end
end
