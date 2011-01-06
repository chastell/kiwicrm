module KiwiCRM describe People do

  before do
    @archchancellor = People.find { |p| p.id == 'archchancellor' }
    @librarian      = People.find { |p| p.id == 'librarian' }
  end

  describe '.all' do

    it 'returns an Enumerator with all the Person objects' do
      People.all.should be_an Enumerator
      People.all.should include @archchancellor
      People.all.should include @librarian
      People.all.to_a.size.should == 2
    end

  end

  describe '.find' do

    it 'returns the first Person fulfilling the requirements' do
      People.find { |p| p.surname == 'Ridcully'  }.should == @archchancellor
      People.find { |p| p.surname == 'Worblehat' }.should == @librarian
    end

  end

  describe '.id' do

    it 'returns the first Person with the given id' do
      People.id('archchancellor').should == People.find { |p| p.id == 'archchancellor' }
      People.id('librarian').should      == People.find { |p| p.id == 'librarian' }
    end

  end

end end
