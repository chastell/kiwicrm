module KiwiCRM module People

  extend self

  def all
    ObjectSpace.each_object Person
  end

  def find &conditions
    all.find &conditions
  end

end end
