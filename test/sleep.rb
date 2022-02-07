# Debugging setup values
puts "REF is equal to '#{ENV["REF"]}'" if ENV["REF"]
puts "PR_TITLE is equal to '#{ENV["PR_TITLE"]}" if ENV["PR_TITLE"]

# Decide if setup values mean test should fail
if ENV["PR_TITLE"] && ENV["REF"] && ENV["PR_TITLE"].downcase.include?("fail in the queue")
  # REF is equal to 'refs/heads/gh-readonly-queue/main/pr-4-14e30f6938f96698309aec5bb5a293b0f5343e8a'
  if ENV["REF"].downcase.include?("refs/heads/gh-readonly-queue")
    raise "Manually failing in the merge queue due to PR title" 
  end
elsif ENV["PR_TITLE"] && ENV["PR_TITLE"].downcase.include?("fail")
  raise "Manually failing PR due to PR title"
end

# Set the sleep time
if ENV["TEST_DELAY_TIME_SECONDS"].to_s.empty?
  puts "Using default sleep time"
  sleep 10
else
  puts "Sleep time set to #{ENV["TEST_DELAY_TIME_SECONDS"].to_i} via repository secret"
  sleep ENV["TEST_DELAY_TIME_SECONDS"].to_i
end
