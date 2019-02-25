class CurrentForecast
  attr_reader :summary, :icon, :time, :temperature, :feels_like, :humidity, :uvIndex, :visibility
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