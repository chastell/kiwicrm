module KiwiCRM module Entity

  module ClassMethods

    def entity_pool entity_pool = nil
      @entity_pool ||= entity_pool
    end

  end

  def initialize hash = {}
    @properties = {id: object_id}.merge hash
    self.class.entity_pool << self
  end

  def method_missing method, *args, &block
    if method =~ /.=$/
      @properties[method[0...-1].to_sym] = args.first
    else
      @properties[method] or super
    end
  end

  def related
    EntityRels.new self
  end

  private

  def self.included receiver
    receiver.extend ClassMethods
  end

end end
