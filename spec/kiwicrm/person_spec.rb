module KiwiCRM describe Person do

  describe '.new' do

    it 'allows for setting arbitrary properties' do
      bengo = Person.new given_names: ['Bengo'], surname: 'Macarona'
      bengo.title = 'Professor'
      bengo.given_names.first.should == 'Bengo'
    end

  end

end end
