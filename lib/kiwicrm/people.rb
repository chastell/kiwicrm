module KiwiCRM class People

  def self.all
    ObjectSpace.each_object Person
  end

  def self.find &conditions
    all.find &conditions
  end

end end
