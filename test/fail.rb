if ENV["TEST_DELAY_TIME_SECONDS"].to_s.empty?
  puts "Using default sleep time"
  sleep 10
  raise "This test is configured to fail" if ENV["NOT_REQUIRED_TEST_FAILING"].downcase == "true"
else
  puts "Sleep time set to #{ENV["TEST_DELAY_TIME_SECONDS"].to_i} via repository secret"
  sleep ENV["TEST_DELAY_TIME_SECONDS"].to_i
  raise "This test always fails" if ENV["NOT_REQUIRED_TEST_FAILING"].downcase == "true"
end
