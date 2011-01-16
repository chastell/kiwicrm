module KiwiCRM class EntityRels < Array

  def initialize object
    super Rels.select { |rel| rel.refs? object }
    @rels = group_by { |rel| rel.rel_to_other object }.each_value { |rels| rels.map! { |rel| rel.other_ref object } }
  end

  def method_missing method, *args, &block
    @rels[method] or super
  end

end end
