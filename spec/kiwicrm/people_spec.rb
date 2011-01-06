module KiwiCRM describe People do

  describe '.all' do

    it 'returns an Enumerator with all the Person objects' do
      librarian = Person.new YAML.load_file('spec/fixtures/people.yml').first
      People.all.should be_an Enumerator
      People.all.to_a.should == [librarian]
    end

  end

end end
