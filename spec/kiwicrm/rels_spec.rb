module KiwiCRM describe Rels do

  describe '.clear' do

    it 'clears the Rel pool' do
      Rels.to_a.size.should == 2
      Rels.clear
      Rels.to_a.size.should == 0
    end

  end

  describe '.of' do

    it 'returns Rel objects referencing the parameter' do
      rel = Rel.new refs: [{ref: People, id: :young_sam}, {ref: People, id: :sam}]
      sams_rels = Rels.of People.id(:sam)
      sams_rels.should include rel
      sams_rels.size.should == 2
    end

  end

end end
