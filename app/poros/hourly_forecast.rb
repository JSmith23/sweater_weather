class HourlyForecast
  def initialize(data)
    @time = data[:time]
    @icon = data[:icon]
    @temp = data[:temperature]
  end
end