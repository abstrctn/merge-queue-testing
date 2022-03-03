require "minitest/autorun"
require_relative "../adder"

describe Adder do
  before do
    @adder = Adder.new
    sleep ENV["TEST_DELAY_TIME_SECONDS"].to_i if ENV["TEST_DELAY_TIME_SECONDS"]
  end

  describe "#add" do
    it "adds two values" do
      assert_equal 3, @adder.add(1, 2)
    end
  end
end
