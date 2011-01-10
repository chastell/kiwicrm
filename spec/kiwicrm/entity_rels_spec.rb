module KiwiCRM describe EntityRels do

  describe '.new' do

    it 'creates a store of Rel objects referencing the parameter' do
      rel = Rel.new refs: [{ref: People, id: :young_sam}, {ref: People, id: :sam}]
      sams = EntityRels.new People.id :sam
      sams.should include rel
      sams.size.should == 3
    end

  end

end end
