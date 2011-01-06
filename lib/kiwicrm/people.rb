module KiwiCRM module People

  extend self, Enumerable

  def all
    find_all
  end

  private

  def each
    ObjectSpace.each_object(Person) { |p| yield p }
  end

end end
