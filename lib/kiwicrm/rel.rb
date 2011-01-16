module KiwiCRM class Rel

  include Entity

  entity_pool Rels

  def refs? object
    refs.include?({ref: object.class.entity_pool, id: object.id})
  end

end end
