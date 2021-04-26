class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

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


  private

  def plan_params
    params.require(:plan).permit(:date, :plan).merge(user_id: current_user.id)
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


      wday_num = Date.today.wday + x
  
      if wday_num >= 7
        wday_num = wday_num -7
      end

      days = { month: (@todays_date + x).month, date: (@todays_date + x).day, plans: today_plans, wday: wdays[wday_num] }
      @week_days.push(days)
    end

    def set_plan
      @plan = Plan.find(params[:id])
    end
  end
end
