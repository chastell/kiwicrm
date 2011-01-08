module KiwiCRM describe Rel do

  describe '.new' do

    it 'allows for setting arbitrary properties' do
      ankhd = Rel.new refs: [{ref: People, id: :sam}, {ref: People, id: :sybil}], rels: [:spouses, :spouses]
      ankhd.type = :marriage
      ankhd.type.should == :marriage
    end

  end

end end
