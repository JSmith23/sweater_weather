class DailyForecast
  attr_reader :icon, :precip, :high, :low
  def initialize(data)
    @icon =   data[:icon]
    @precip = data[:precipProbability]
    @high =   data[:temperatureHigh]
    @low =    data[:temperatureLow]
  end
end