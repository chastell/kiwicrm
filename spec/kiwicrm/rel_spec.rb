# encoding: UTF-8

module KiwiCRM describe Rel do

  describe '.new' do

    it 'adds the new Rel to Rels' do
      Rels.should_receive(:<<).with an_instance_of Rel
      Rel.new
    end

  end

  describe '#other_obj' do

    it 'returns the other object in the Rel' do
      Rels.id(:'forty-two').other_obj(People.id :sybil).should     == People.id(:young_sam)
      Rels.id(:'forty-two').other_obj(People.id :young_sam).should == People.id(:sybil)
      Rels.id(:'forty-two').other_obj(People.id :sam).should       == nil
    end

  end

  describe '#other_ref' do

    it 'returns the ref in the Rel referencing the other object than passed' do
      Rels.id(:'forty-two').other_ref(People.id :sybil).should     == {ref: People, id: :young_sam}
      Rels.id(:'forty-two').other_ref(People.id :young_sam).should == {ref: People, id: :sybil}
      Rels.id(:'forty-two').other_ref(People.id :sam).should       == nil
    end

  end

  describe '#rel_to_other' do

    it 'returns the relationship to the other object' do
      Rels.id(:'forty-two').rel_to_other(People.id :sybil).should     == :children
      Rels.id(:'forty-two').rel_to_other(People.id :young_sam).should == :parents
      Rels.id(:'forty-two').rel_to_other(People.id :sam).should       == nil
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
