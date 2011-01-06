module KiwiCRM describe Person do

  describe '.new' do

    it 'allows for setting arbitrary properties' do
      People.id('librarian').given_names.first.should == 'Horace'
    end

  end

end end
