module KiwiCRM describe EntityPool do

  before do
    ExamplePool.clear
  end

  describe '.<<' do

    it 'adds the passed object to the pool' do
      object = OpenStruct.new id: :object
      ExamplePool.find { |e| e.id == :object}.should be_nil
      ExamplePool << object
      ExamplePool.find { |e| e.id == :object}.should == object
    end

  end

  describe '.clear' do

    it 'clears the pool' do
      7.times { ExamplePool << OpenStruct.new(id: rand) }
      ExamplePool.to_a.size.should == 7
      ExamplePool.clear
      ExamplePool.to_a.size.should == 0
    end

  end

  describe '.find' do

    it 'returns the first object fulfilling the requirements' do
      ExamplePool << (fun  = OpenStruct.new id: :fun,  lang: 'Ruby')
      ExamplePool << (work = OpenStruct.new id: :work, lang: 'PHP')
      ExamplePool.find { |p| p.lang == 'Ruby' }.should == fun
      ExamplePool.find { |p| p.id   == :work  }.should == work
    end

  end

  describe '.id' do

    it 'returns the first object with the given id' do
      ExamplePool << (fun  = OpenStruct.new id: :fun)
      ExamplePool << (work = OpenStruct.new id: :work)
      ExamplePool.id(:fun).should == fun
      ExamplePool.id(:work).should == work
    end

  end

end end
