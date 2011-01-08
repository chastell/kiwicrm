module KiwiCRM describe Rel do

  describe '.new' do

    it 'adds the new Rel to Rels' do
      Rels.should_receive(:<<).with an_instance_of Rel
      Rel.new
    end

  end

end end
