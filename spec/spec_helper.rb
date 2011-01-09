module KiwiCRM RSpec.configure do |config|

  module ExamplePool
    extend EntityPool
  end

  class ExampleEntity
    include Entity
    entity_pool ExamplePool
  end

  config.before do

    People.clear

    YAML.load_file('spec/fixtures/people.yml').each do |hash|
      Person.new hash
    end

    Rels.clear

    YAML.load_file('spec/fixtures/rels.yml').each do |hash|
      hash[:refs].map! { |ref| {ref: KiwiCRM.const_get(ref.first), id: ref.last} }
      Rel.new hash
    end

  end

end end
