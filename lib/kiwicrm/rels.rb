module KiwiCRM module Rels

  extend self, EntityPool

  def of object
    select { |rel| rel.refs.include?({ref: People, id: object.id}) }
  end

end end
