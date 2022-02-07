# Debugging setup values
puts "REF is set to '#{ENV["REF"]}'" if ENV["REF"]
puts "PR_TITLE is set to '#{ENV["PR_TITLE"]}'" if ENV["PR_TITLE"]

manual_failure = nil

# Decide if setup values mean test should fail
#
# PR_TITLE is empty for PR's in the merge queue 🤷🏼
if ENV["REF"] && (ENV["PR_TITLE"].downcase.include?("fail in the queue") || ENV["PR_TITLE"].empty?)
  # REF looks like 'refs/heads/gh-readonly-queue/main/pr-4-14e30f6938f96698309aec5bb5a293b0f5343e8a'
  if ENV["REF"].downcase.include?("refs/heads/gh-readonly-queue")
    manual_failure = "Manually failing in the merge queue due to PR title" 
  end
elsif ENV["PR_TITLE"] && ENV["PR_TITLE"].downcase.include?("fail the pr")
  manual_failure = "Manually failing PR due to PR title"
end

# Set the sleep time and raise manual_failure if set
if ENV["TEST_DELAY_TIME_SECONDS"].to_s.empty?
  puts "Using default sleep time"
  sleep 10
  raise manual_failure if manual_failure
else
  puts "Sleep time set to #{ENV["TEST_DELAY_TIME_SECONDS"].to_i} via repository secret"
  sleep ENV["TEST_DELAY_TIME_SECONDS"].to_i
  raise manual_failure if manual_failure
end
