module KiwiCRM describe Rel do

  describe '.new' do

    it 'allows for setting arbitrary properties' do
      ankhd = Rel.new refs: [{ref: People, id: :sam}, {ref: People, id: :sybil}], rels: [:spouses, :spouses]
      ankhd.type = :marriage
      ankhd.type.should == :marriage
    end

    it 'adds the new Rel to Rels' do
      Rels.should_receive(:<<).with an_instance_of Rel
      Rel.new
    end

  end

end end
