# Debugging setup values
puts "REF is set to '#{ENV["REF"]}'"
puts "PR_TITLE is set to '#{ENV["PR_TITLE"]}'"
puts "HEAD_REF is set to '#{ENV["HEAD_REF"]}'"
puts "PR_NUMBER is set to '#{ENV["PR_NUMBER"]}'"

PR_FROM_MQ_REF_REGEX = /refs\/heads\/gh-readonly-queue\/main\/pr-(\d+)-/
if ENV["PR_NUMBER"].empty? && ENV["REF"].match?(PR_FROM_MQ_REF_REGEX)
  ENV["PR_NUMBER"] = ENV["REF"].match(PR_FROM_MQ_REF_REGEX)[1]
  puts "PR_NUMBER was updated to '#{ENV["PR_NUMBER"]}'"
end

manual_failure = nil

# Decide if setup values mean test should fail
#
# REF looks like 'refs/heads/gh-readonly-queue/main/pr-4-14e30f6938f96698309aec5bb5a293b0f5343e8a'
if ENV["REF"] && ENV["REF"].downcase.include?("refs/heads/gh-readonly-queue")
  if ENV["PR_NUMBER"] && ENV["FAIL_ODD_PRS"].downcase == "true" && ENV["PR_NUMBER"].to_i.odd?
    manual_failure = "Manually failing in the merge queue due to PR title and PR number" 
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
