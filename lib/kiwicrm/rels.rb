module KiwiCRM module Rels

  extend self, Enumerable

  def << rel
    @rels ||= {}
    @rels[rel.id] = rel
  end

  def clear
    @rels = {}
  end

  def of object
    select { |rel| rel.refs.include?({ref: People, id: object.id}) }
  end

  private

  def each
    (@rels or {}).each_value { |rel| yield rel }
  end

end end
