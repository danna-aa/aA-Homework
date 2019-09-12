require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Gordan Ramsay") }
  subject(:dessert) { Dessert.new("cookie", 12, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('cookie')
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(12)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new("cookie", "12", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("flour")
      expect(dessert.ingredients).to eq(["flour"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("sugar")
      dessert.add_ingredient("butter")
      dessert.add_ingredient("eggs")
      dessert.mix!
      expect(dessert.ingredients).to match_array(["sugar",  "eggs", "butter"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(6)
      expect(dessert.quantity).to eq(6)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{ dessert.eat(100) }.to raise_error(RuntimeError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Gordan Ramsay the Great Baker")
      expect(dessert.serve).to eq("Chef Gordan Ramsay the Great Baker has made 12 cookies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
