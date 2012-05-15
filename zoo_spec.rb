# Zoo spec file
require "./zoo"
require "rspec"

class Grasshoppers < Food; end
class Salad < Food; end

describe Tacos do
	it "should know all tacos are equal" do
		(Tacos.new == Tacos.new).should be_true
	end
end

describe Panda do

	it "should like bamboo" do
		Panda.new.likes?(Bamboo.new).should eq(true)
	end

	it "should not like grasshoppers" do
		Panda.new.likes?(Grasshoppers.new).should eq(false)
	end

	it "should be able to eat the food" do
		Panda.new.eat(Bamboo.new).should be_true
	end

	it "should be full after eating 30 bamboo" do
		panda = Panda.new
		31.times do
			panda.eat(Bamboo.new)	
		end
		panda.should be_full
	end

	it "should not be full after 1" do
		panda = Panda.new
		panda.eat(Bamboo.new)	
		panda.should_not be_full
	end
end

describe Lion do
	it "should like wildebeests" do
		Lion.new.likes?(Wildebeests.new).should eq(true)
	end

	it "should like zeebras" do
		Lion.new.likes?(Zeebras.new).should eq(true)
	end

	it "should not like salad" do
		Lion.new.likes?(Salad.new).should eq(false)
	end

	it "should take 11 meals to be full" do
		lion = Lion.new
		lion.eat(Zeebras.new)
		lion.should_not be_full
	end
	it "should take 11 meals to be full" do
		lion = Lion.new
		11.times do
			lion.eat(Zeebras.new)
		end
		lion.should be_full
	end
end

describe Zookeeper do
	it "should be able to feed bamboo to the pandas" do
		panda = Panda.new
		panda.should_receive(:eat).with(:bamboo)
		Zookeeper.new.feed(food: :bamboo, to: panda)
	end

	it "should be able to feed zeebras to the lions" do
		lion = Lion.new
		lion.should_receive(:eat).with(:zeebras)
		Zookeeper.new.feed(food: :zeebras, to: lion)
	end
end

describe Human do
	it "should like tacos" do
		Human.new.likes?(Tacos.new).should eq(true)
	end

	it "should like bacon" do
		Human.new.likes?(Bacon.new).should eq(true)
	end
	
	it "should not like bamboo" do
		Human.new.likes?(Bamboo.new).should eq(false)
	end

end

describe Foodbarge do 
#	it "should have bamboo for the pandas" do
#		food = Foodbarge.new.food_for(:panda)
#		Panda.new.likes?(food).should eq(true)
#	end
end

