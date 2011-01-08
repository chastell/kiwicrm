module KiwiCRM class Rel < Entity

  def initialize *args
    super
    Rels << self
  end

end end
