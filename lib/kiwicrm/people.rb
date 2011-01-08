module KiwiCRM module People

  extend self, Enumerable

  def << person
    @people ||= {}
    @people[person.id] = person
  end

  def all
    select
  end

  def id id
    find { |p| p.id == id }
  end

  def clear
    @people = {}
  end

  private

  def each
    (@people or {}).each_value { |person| yield person }
  end

end end
