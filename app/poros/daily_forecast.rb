class DailyForecast
  attr_reader :day, :icon, :precip, :high, :low
  def initialize(data)
    @day =   Time.at(data[:time]).strftime("%A")
    @icon =   data[:icon]
    @precip = data[:precipProbability]
    @high =   data[:temperatureHigh]
    @low =    data[:temperatureLow]
  end
end