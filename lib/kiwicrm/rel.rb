module KiwiCRM class Rel

  include Entity

  entity_pool Rels

  def other_obj object
    ref = other_ref object
    ref ? ref[:ref].id(ref[:id]) : nil
  end

  def other_ref object
    case {ref: object.class.entity_pool, id: object.id}
    when refs.first then refs.last
    when refs.last  then refs.first
    end
  end

  def rel_to_other object
    case {ref: object.class.entity_pool, id: object.id}
    when refs.first then rels.last
    when refs.last  then rels.first
    end
  end

  def refs? object
    refs.include?({ref: object.class.entity_pool, id: object.id})
  end

end end
