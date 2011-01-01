module KiwiCRM describe Person do

  describe '.new' do

    it 'allows for setting arbitrary properties' do
      librarian = Person.new name_prefix: 'Dr', given_names: ['Horace'], surname: 'Worblehat'
      librarian.given_names.first.should == 'Horace'
    end

  end

end end
