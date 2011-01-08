module KiwiCRM describe Person do

  describe '.new' do

    it 'allows for setting arbitrary properties' do
      bengo = Person.new given_names: ['Bengo'], surname: 'Macarona'
      bengo.title = 'Professor'
      bengo.given_names.first.should == 'Bengo'
    end

    it 'adds the new Person to People' do
      People.should_receive(:<<).with an_instance_of Person
      Person.new
    end

  end

end end
