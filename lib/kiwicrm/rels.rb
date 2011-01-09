module KiwiCRM module Rels

  extend self, EntityPool

  def of object
    select { |rel| rel.refs.include?({ref: object.class.entity_pool, id: object.id}) }
  end

end end
