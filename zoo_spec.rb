# Zoo spec file
require "./zoo"

describe Panda do

	it "should like bamboo" do
		Panda.new.likes?(:bamboo).should eq(true)
	end

	it "should like bamboo as a string" do
		Panda.new.likes?("bamboo").should eq(true)
	end

	it "should not like grasshoppers" do
		Panda.new.likes?(:grasshoppers).should eq(false)
	end

	it "should be able to eat the food" do
		Panda.new.eat(:bamboo).should be_true
	end

	it "should be full after eating 30 bamboo" do
		panda = Panda.new
		31.times do
			panda.eat(:bamboo)	
		end
		panda.should be_full
	end

	it "should not be full after 1" do
		panda = Panda.new
		panda.eat(:bamboo)	
		panda.should_not be_full
	end
end

describe Lion do
	it "should like wildebeests" do
		Lion.new.likes?(:wildebeests).should eq(true)
	end

	it "should like zeebras" do
		Lion.new.likes?(:zeebras).should eq(true)
	end

	it "should not like salad" do
		Lion.new.likes?(:salad).should eq(false)
	end

	it "should take 11 meals to be full" do
		lion = Lion.new
		lion.eat(:zeebras)
		lion.should_not be_full
	end
	it "should take 11 meals to be full" do
		lion = Lion.new
		11.times do
			lion.eat(:zeebras)
		end
		lion.should be_full
	end
end

describe Human do
  before(:each) do
    @human = Human.new
  end
  
  it "should like bacon" do
    @human.likes?(:bacon).should eq(true)
  end
  it "should like tacos" do
    @human.likes?(:tacos).should eq(true)
  end
  it "should not like bamboo" do
    @human.likes?(:bamboo).should eq(false)
  end
end

describe Zookeeper do
  before(:each) do
    @zookeeper = Zookeeper.new
  end
  
	it "should be able to feed bamboo to the pandas" do
		panda = Panda.new
		panda.should_receive(:eat).with(:bamboo)
		@zookeeper.feed(food: :bamboo, to: panda)
	end

	it "should be able to feed zeebras to the lions" do
		lion = Lion.new
		lion.should_receive(:eat).with(:zeebras)
		@zookeeper.feed(food: :zeebras, to: lion)
	end
	
	it "should be able to feed bacon to the human" do
		human = Human.new
		human.should_receive(:eat).with(:bacon)
		@zookeeper.feed(food: :bacon, to: human)
	end
	
	it "should be able to feed bacon to itself" do
	  @zookeeper.feed(food: :bacon, to: @zookeeper)
	end
end