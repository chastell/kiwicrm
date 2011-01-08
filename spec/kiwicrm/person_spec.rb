module KiwiCRM describe Person do

  describe '.new' do

    it 'adds the new Person to People' do
      People.should_receive(:<<).with an_instance_of Person
      Person.new
    end

  end

end end
