module KiwiCRM describe EntityRels do

  describe '#{rels}' do

    it 'return refs pointed by given rels' do
      sam       = People.id :sam
      sybil     = People.id :sybil
      young_sam = People.id :young_sam

      sams       = EntityRels.new sam
      sybils     = EntityRels.new sybil
      young_sams = EntityRels.new young_sam

      sams.spouses.should be_an Enumerator
      sams.spouses.should       include sybil
      sybils.spouses.should     include sam
      sams.children.should      include young_sam
      sybils.children.should    include young_sam
      young_sams.parents.should include sam
      young_sams.parents.should include sybil

      lambda { young_sams.toys }.should raise_error NoMethodError, /undefined method `toys'/
    end

  end

end end
