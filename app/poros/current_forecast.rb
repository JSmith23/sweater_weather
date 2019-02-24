class CurrentForecast
  def initialize(data)
    @summary =     data[:summary]
    @icon =        data[:icon]
    @time =        data[:time]
    @temperature = data[:temperature]
    @feels_like =  data[:apparentTemperature]
    @humidity =    data[:humidity]
    @uvIndex =     data[:uvIndex]
    @visibility =  data[:visibility ]
  end
end