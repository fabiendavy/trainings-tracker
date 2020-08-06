module CurrentCalculator
  class CurrentWeekTime
    def self.call(user, date)
      @user = user
      @beginning_date = date.beginning_of_week

      @trainings = get_week_trainings
      @time_in_seconds = total_time
      @time_in_string = Convertor::ConvertSecondsInString.call(@time_in_seconds)
    end

    private

    def self.get_week_trainings
      @user.trainings.where('trainings.date >= ?', @beginning_date)
    end

    def self.total_time
      total_of_seconds = 0
      @trainings.each do |training|
        seconds = Convertor::ConvertStringInSeconds.call(training.time)
        total_of_seconds += seconds
      end
      total_of_seconds
    end

  end
end
