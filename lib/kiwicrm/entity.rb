module KiwiCRM class Entity

  def self.entity_pool entity_pool = nil
    @entity_pool ||= entity_pool
  end

  def initialize hash = {}
    @properties = {id: object_id}.merge hash
    self.class.entity_pool << self
  end

  def method_missing method, *args, &block
    if method =~ /.=$/
      @properties[method[0...-1].to_sym] = args.first
    elsif args.empty? and @properties[method]
      @properties[method]
    else
      super
    end
  end

end end
