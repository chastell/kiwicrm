module KiwiCRM class EntityRels < Array

  def initialize object
    @ref = {ref: object.class.entity_pool, id: object.id}
    super Rels.select { |rel| rel.refs.include? @ref }
    @rels = group_by do |rel|
      rel.rels rescue next
      case @ref
      when rel.refs.first then rel.rels.last
      when rel.refs.last  then rel.rels.first
      end
    end.each_value { |rels| rels.map! { |rel| rel.refs - [@ref] }.flatten!.uniq! }
  end

  def method_missing method, *args, &block
    @rels[method] or super
  end

end end
