module KiwiCRM class People

  def self.all
    ObjectSpace.each_object Person
  end

end end
