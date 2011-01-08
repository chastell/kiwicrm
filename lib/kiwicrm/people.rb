module KiwiCRM module People

  extend self, Enumerable

  def << person
  end

  def all
    select
  end

  def id id
    find { |p| p.id == id }
  end

  private

  def each
    ObjectSpace.each_object(Person) { |p| yield p }
  end

end end
