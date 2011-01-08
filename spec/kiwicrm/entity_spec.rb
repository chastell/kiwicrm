module KiwiCRM describe Entity do

  class ExampleEntity < Entity
    entity_pool ExamplePool
  end

  describe '.new' do

    it 'allows for setting and retrieving arbitrary properties' do
      entity = ExampleEntity.new foo: :bar
      entity.baz = 'qux'
      entity.foo.should == :bar
      entity.baz.should == 'qux'
    end

    it 'adds the new ExampleEntity to ExamplePool' do
      ExamplePool.should_receive(:<<).with an_instance_of ExampleEntity
      ExampleEntity.new
    end

  end

end end
