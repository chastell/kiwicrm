module KiwiCRM class EntityRels < Array

  def initialize object
    super Rels.select { |rel| rel.refs? object }
    @rels = Hash[map { |rel| rel.rel_of object }.group_by(&:first).map { |rel, rel_ofs| [rel, rel_ofs.map(&:last)] }]
  end

  def method_missing method, *args, &block
    @rels[method] or super
  end

end end
