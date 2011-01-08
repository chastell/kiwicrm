module KiwiCRM describe Entity do

  class ExampleEntity < Entity
    entity_pool ExamplePool
  end

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
      entity.baz = 'qux'
      entity.baz.should == 'qux'
      lambda { entity.baz :quux }.should raise_error
      lambda { entity.corge     }.should raise_error
    end

  end

end end
