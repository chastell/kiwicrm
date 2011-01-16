module KiwiCRM describe EntityRels do

  describe '.new' do

    it 'creates a store of Rel objects referencing the parameter' do
      rel = Rel.new refs: [{ref: People, id: :young_sam}, {ref: People, id: :sam}], rels: [:students, :teachers]
      sams = EntityRels.new People.id :sam
      sams.should include rel
      sams.size.should == 3
    end

  end

  describe '#{rels}' do

    it 'return refs pointed by given rels' do
      sams       = EntityRels.new People.id :sam
      sybils     = EntityRels.new People.id :sybil
      young_sams = EntityRels.new People.id :young_sam

      sams.spouses.should    == [{ref: People, id: :sybil}]
      sybils.spouses.should  == [{ref: People, id: :sam}]
      sams.children.should   == [{ref: People, id: :young_sam}]
      sybils.children.should == [{ref: People, id: :young_sam}]
      young_sams.parents.should include({ref: People, id: :sam})
      young_sams.parents.should include({ref: People, id: :sybil})
    end

  end

end end
