pr_name = ARGV.join(" ")

if pr_name && pr_name.downcase.include?("fail")
  raise "Manually failing PR due to PR name"
elsif ENV["TEST_DELAY_TIME_SECONDS"].to_s.empty?
  puts "Using default sleep time"
  sleep 10
else
  puts "Sleep time set to #{ENV["TEST_DELAY_TIME_SECONDS"].to_i} via repository secret"
  sleep ENV["TEST_DELAY_TIME_SECONDS"].to_i
end
