module KiwiCRM class Person < OpenStruct

  def initialize *args
    super
    People << self
  end

end end
