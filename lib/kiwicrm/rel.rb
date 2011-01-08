module KiwiCRM class Rel < OpenStruct

  def initialize *args
    super
    Rels << self
  end

end end
