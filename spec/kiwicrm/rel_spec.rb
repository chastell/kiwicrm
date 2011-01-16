module KiwiCRM describe Rel do

  describe '.new' do

    it 'adds the new Rel to Rels' do
      Rels.should_receive(:<<).with an_instance_of Rel
      Rel.new
    end

  end

  describe '#refs?' do

    it 'returns a predicate whether the Rel refs the given object' do
      Rels.id(:ankhd).should     be_refs People.id :sam
      Rels.id(:ankhd).should     be_refs People.id :sybil
      Rels.id(:ankhd).should_not be_refs People.id :young_sam
    end

  end

end end
