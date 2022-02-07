puts "HEAD_REF is equal to '#{ENV["HEAD_REF"]}'" if ENV["HEAD_REF"]

if ENV["PR_NAME"] && ENV["PR_NAME"].downcase.include?("fail")
  raise "Manually failing PR due to PR name"
# elsif ENV["PR_NUMBER"] && ENV["PR_NUMBER"].to_i.odd?
#   raise "Manually failing PR due to PR number"
elsif ENV["TEST_DELAY_TIME_SECONDS"].to_s.empty?
  puts "Using default sleep time"
  sleep 10
else
  puts "Sleep time set to #{ENV["TEST_DELAY_TIME_SECONDS"].to_i} via repository secret"
  sleep ENV["TEST_DELAY_TIME_SECONDS"].to_i
end
