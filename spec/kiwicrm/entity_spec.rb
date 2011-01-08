module KiwiCRM describe Entity do

  class ExampleEntity < Entity
  end

  describe '.new' do

    it 'allows for setting and retrieving arbitrary properties' do
      entity = ExampleEntity.new foo: :bar
      entity.baz = 'qux'
      entity.foo.should == :bar
      entity.baz.should == 'qux'
    end

  end

end end
