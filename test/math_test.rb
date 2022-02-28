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

    it "raises for invalid agruments" do
      error = assert_raises(ArgumentError) do
        @adder.add("bleep", "bloop")
      end

      assert_equal "Arguments must be integers", error.message
    end
  end
end
