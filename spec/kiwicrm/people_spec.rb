module KiwiCRM describe People do

  describe '.all' do

    it 'returns an Enumerator with all the Person objects' do
      archchancellor = Person.new YAML.load_file('spec/fixtures/people.yml').first
      librarian      = Person.new YAML.load_file('spec/fixtures/people.yml').last
      People.all.should be_an Enumerator
      People.all.should include archchancellor
      People.all.should include librarian
      People.all.to_a.size.should == 2
    end

  end

  describe '.find' do

    it 'returns the first Person fulfilling the requirements' do
      archchancellor = Person.new YAML.load_file('spec/fixtures/people.yml').first
      librarian      = Person.new YAML.load_file('spec/fixtures/people.yml').last
      People.find { |p| p.surname == 'Ridcully'  }.should == archchancellor
      People.find { |p| p.surname == 'Worblehat' }.should == librarian
    end

  end

end end
