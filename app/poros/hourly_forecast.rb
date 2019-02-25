class HourlyForecast
  attr_reader :time, :icon, :temp
  def initialize(data)
    @time = data[:time]
    @icon = data[:icon]
    @temp = data[:temperature]
  end
end