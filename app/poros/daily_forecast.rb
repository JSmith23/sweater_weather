class DailyForecast
  def initialize(data)
    @icon =   data[:icon]
    @precip = data[:precipProbability]
    @high =   data[:temperatureHigh]
    @low =    data[:temperatureLow]
  end
end