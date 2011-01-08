module KiwiCRM class Person < Entity

  def initialize *args
    super
    People << self
  end

end end
