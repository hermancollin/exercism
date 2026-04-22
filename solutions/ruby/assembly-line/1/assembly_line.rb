class AssemblyLine
  HOURLY_RATE = 221

  def initialize(speed)
    @speed = speed
    if speed <= 4
      @success_rate = 1
    elsif speed <= 8
      @success_rate = 0.9
    elsif speed == 9
      @success_rate = 0.8
    else
      @success_rate = 0.77
    end
  end

  def production_rate_per_hour
    @success_rate * @speed * HOURLY_RATE
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end
