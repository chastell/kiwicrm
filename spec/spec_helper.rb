RSpec.configure do |config|

  config.before :all do
    YAML.load_file('spec/fixtures/people.yml').each do |hash|
      KiwiCRM::Person.new hash
    end
  end

end
