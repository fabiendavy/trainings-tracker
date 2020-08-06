module CurrentCalculator
  class Current
    def self.call(user, date)
      @user = user
      @beginning_date = date

      @swim_trainings = get_week_trainings('Swim')
      @bike_trainings = get_week_trainings('Bike')
      @run_trainings = get_week_trainings('Run')
      @gym_trainings = get_week_trainings('Gym')
    
      @swim_hash = hash_sport_info(@swim_trainings)
      @bike_hash = hash_sport_info(@bike_trainings)
      @run_hash = hash_sport_info(@run_trainings)
      @gym_hash = hash_sport_info(@gym_trainings)
      @totals = get_totals

      return {
        swim: @swim_hash,
        bike: @bike_hash,
        run:  @run_hash,
        gym:  @gym_hash,
        totals: @totals
      }
    end

    private

    def self.get_week_trainings(sport)
      @user.trainings.where('trainings.date >= ? AND trainings.sport = ?', @beginning_date, sport)
    end

    def self.hash_sport_info(sport)
      hash = Hash.new(0)
      sport.each do |training|
        hash[:time] += Convertor::ConvertStringInSeconds.call(training.time)
        hash[:distance] += training.distance
      end
      hash[:sessions] = sport.count
      hash[:distance] = hash[:distance].round(2)
      hash
    end

    def self.get_totals
      hash = {
        sessions: @swim_hash[:sessions] + @bike_hash[:sessions] + @run_hash[:sessions] + @gym_hash[:sessions],
        time: @swim_hash[:time] + @bike_hash[:time] + @run_hash[:time] + @gym_hash[:time],
        distance: @swim_hash[:distance] + @bike_hash[:distance] + @run_hash[:distance] + @gym_hash[:distance]
      }
    end
  end
end
