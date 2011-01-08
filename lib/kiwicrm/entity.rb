module KiwiCRM class Entity < OpenStruct

  def self.entity_pool entity_pool = nil
    @entity_pool ||= entity_pool
  end

  def initialize *args
    super
    self.class.entity_pool << self
  end

end end
