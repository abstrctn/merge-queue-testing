if ENV["TEST_DELAY_TIME_SECONDS"].to_s.empty?
  puts "Using default sleep time"
  sleep 10
  raise "This test always fails"
else
  puts "Sleep time set to #{ENV["TEST_DELAY_TIME_SECONDS"].to_i} via repository secret"
  sleep ENV["TEST_DELAY_TIME_SECONDS"].to_i
  raise "This test always fails"
end
