module KiwiCRM class EntityRels < Array

  def initialize object
    super Rels.select { |rel| rel.refs.include?({ref: object.class.entity_pool, id: object.id}) }
  end

end end
