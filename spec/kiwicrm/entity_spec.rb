module KiwiCRM describe Entity do

  describe '.new' do

    it 'allows for setting arbitrary properties' do
      entity = ExampleEntity.new foo: :bar
      entity.foo.should == :bar
    end

    it 'adds the new ExampleEntity to ExamplePool' do
      ExamplePool.should_receive(:<<).with an_instance_of ExampleEntity
      ExampleEntity.new
    end

  end

  describe '#method_missing' do

    it 'allows for setting and getting arbitrary properties' do
      entity = ExampleEntity.new foo: :bar
      entity.foo.should == :bar
      entity.foo = :baz
      entity.foo.should == :baz
      entity.qux = 'quux'
      entity.qux.should == 'quux'
      lambda { entity.corge }.should raise_error NoMethodError
    end

  end

  describe '#related' do

    it 'returns the relevant EntityRels object, allowing access to related object refs' do
      person = ExampleEntity.new id: :person
      event  = ExampleEntity.new id: :event
      rel    = Rel.new refs: [{ref: ExamplePool, id: :person}, {ref: ExamplePool, id: :event}], rels: [:participants, :events]
      person.related.events.should      include event
      event.related.participants.should include person
    end

  end

end end
