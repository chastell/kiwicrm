module KiwiCRM describe People do

  describe '.all' do

    it 'returns an Enumerator with all the Person objects' do
      People.all.should be_an Enumerator
      People.all.should include People.id :archchancellor
      People.all.should include People.id :librarian
      People.all.to_a.size.should == 5
    end

  end

end end
