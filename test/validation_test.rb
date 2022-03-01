require "minitest/autorun"
require_relative "../adder"

describe Adder do
  before do
    @adder = Adder.new
    sleep ENV["TEST_DELAY_TIME_SECONDS"].to_i if ENV["TEST_DELAY_TIME_SECONDS"]
  end

  describe "#subtract" do
    it "raises for missing method" do
      error = assert_raises(NoMethodError) do
        @adder.subtract(1, 2)
      end
    end
  end

  describe "#add" do
    it "casts non-integer values" do
      assert_equal 0, @adder.add("bleep", "bloop")
    end
  end
end
