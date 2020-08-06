class TrainingsController < ApplicationController

  def dashboard
    @training = Training.new
    @trainings = current_user.trainings.order(date: :desc).first(5)
    @time_week = CurrentCalculator::CurrentWeekTime.call(current_user, Date.today)
  end

  def index
  end

  def create
    @training = Training.new(training_params)
    @training.user = current_user
    if @training.save
      redirect_to trainings_path
    else
      @trainings = current_user.trainings.order(date: :desc).first(5)
      flash[:alert] = "Training not saved."
      render :index
    end
  end

  private

  def training_params
    params.require(:training).permit(:sport, :date, :distance, :time, :ascending_elevation)
  end
end
