class TrainingsController < ApplicationController

  def dashboard
    @training = Training.new
    @trainings = current_user.trainings.order(date: :desc).first(6)

    @data_week = CurrentCalculator::Current.call(current_user, Date.today.beginning_of_week)
    @data_month = CurrentCalculator::Current.call(current_user, Date.today.beginning_of_month)
  end

  def index
    @trainings = current_user.trainings.order(date: :desc)
  end

  def create
    @training = Training.new(training_params)
    @training.user = current_user

    @training.distance = @training.convert_swim_meters_in_kms if @training.incorrect_swim_unit?

    if @training.save
      redirect_to dashboard_path
    else
      @trainings = current_user.trainings.order(date: :desc).first(6)
      flash[:alert] = "Training not saved."
      render :index
    end
  end
  
  def destroy
    @training = Training.find(params[:id])
    @training.destroy
    redirect_to trainings_path
  end

  private

  def training_params
    params.require(:training).permit(:sport, :date, :distance, :time, :ascending_elevation)
  end
end
