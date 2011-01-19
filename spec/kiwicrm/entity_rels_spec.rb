module KiwiCRM describe EntityRels do

  describe '#{rels}' do

    it 'return refs pointed by given rels' do
      sams       = EntityRels.new People.id :sam
      sybils     = EntityRels.new People.id :sybil
      young_sams = EntityRels.new People.id :young_sam

      sams.spouses.should be_an Enumerator
      sams.spouses.should       include({ref: People, id: :sybil})
      sybils.spouses.should     include({ref: People, id: :sam})
      sams.children.should      include({ref: People, id: :young_sam})
      sybils.children.should    include({ref: People, id: :young_sam})
      young_sams.parents.should include({ref: People, id: :sam})
      young_sams.parents.should include({ref: People, id: :sybil})

      lambda { young_sams.toys }.should raise_error NoMethodError, /undefined method `toys'/
    end

  end

end end
