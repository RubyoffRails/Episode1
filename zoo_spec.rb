# Zoo spec file
require "./zoo"
require "./food_barge"

describe Panda do
  before(:each) do
    @panda = Panda.new
  end
	it "should like bamboo" do
		@panda.likes?(:bamboo).should eq(true)
	end

	it "should like bamboo as a string" do
		@panda.likes?("bamboo").should eq(true)
	end

	it "should not like grasshoppers" do
		@panda.likes?(:grasshoppers).should eq(false)
	end

	it "should be able to eat the food" do
		@panda.eat(:bamboo).should be_true
	end

	it "should be full after eating 30 bamboo" do
		31.times do
			@panda.eat(:bamboo)	
		end
		@panda.should be_full
	end

	it "should not be full after 1" do
		@panda.eat(:bamboo)	
		@panda.should_not be_full
	end
end

describe Lion do
  before(:each) do
    @lion = Lion.new
  end
	it "should like wildebeests" do
		@lion.likes?(:wildebeests).should eq(true)
	end

	it "should like zeebras" do
		@lion.likes?(:zeebras).should eq(true)
	end

	it "should not like salad" do
		@lion.likes?(:salad).should eq(false)
	end

	it "should take 11 meals to be full" do
		@lion.eat(:zeebras)
		@lion.should_not be_full
	end
	it "should take 11 meals to be full" do
		11.times do
			@lion.eat(:zeebras)
		end
		@lion.should be_full
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
		@zookeeper.should_receive(:eat).with(:bacon)
		@zookeeper.feed(food: :bacon, to: @zookeeper)
	end
end

describe FoodBarge do
	before(:each) do
		@barge = FoodBarge.new
	end
	it "should return food a panda likes" do
		panda = Panda.new
		panda.likes?(@barge.food_for(panda)).should eq(true)
	end

	it "should feed a panda acceptable food" do
		panda = Panda.new
		food = @barge.food_for(panda)
		panda.should_receive(:eat).with(food)
		zookeeper = Zookeeper.new
		zookeeper.feed(food: food, to: panda)
	end
end