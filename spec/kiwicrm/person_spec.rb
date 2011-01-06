module KiwiCRM describe Person do

  describe '.new' do

    it 'allows for setting arbitrary properties' do
      librarian = People.find { |p| p.id == 'librarian' }
      librarian.given_names.first.should == 'Horace'
    end

  end

end end
