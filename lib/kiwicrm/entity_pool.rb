module KiwiCRM module EntityPool

  include Enumerable

  def << entity
    @entities ||= {}
    @entities[entity.id] = entity
  end

  def clear
    @entities = {}
  end

  def id id
    find { |p| p.id == id }
  end

  private

  def each
    (@entities or {}).each_value { |entity| yield entity }
  end

end end
