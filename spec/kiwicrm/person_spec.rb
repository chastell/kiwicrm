module KiwiCRM describe Person do

  describe '.new' do

    it 'allows for setting arbitrary properties' do
      librarian = Person.new YAML.load_file('spec/fixtures/people.yml').first
      librarian.given_names.first.should == 'Horace'
    end

  end

end end
