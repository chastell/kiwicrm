module KiwiCRM class EntityRels

  def initialize object
    @rels = Rels.select { |rel| rel.refs? object }
                .group_by { |rel| rel.rel_to_other object }
                .each_value { |rels| rels.map! { |rel| rel.other_ref object } }
  end

  def method_missing method, *args, &block
    @rels[method] and @rels[method].each or super
  end

end end
