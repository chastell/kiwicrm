module KiwiCRM module Rels

  extend self, Enumerable

  def of object
    select { |rel| rel.refs.include?({ref: People, id: object.id}) }
  end

  private

  def each
    ObjectSpace.each_object(Rel) { |r| yield r }
  end

end end
