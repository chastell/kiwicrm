YAML.load_file('spec/fixtures/people.yml').each do |hash|
  KiwiCRM::Person.new hash
end

YAML.load_file('spec/fixtures/rels.yml').each do |hash|
  hash[:refs].map! { |ref| {ref: KiwiCRM.const_get(ref.first), id: ref.last} }
  KiwiCRM::Rel.new hash
end
