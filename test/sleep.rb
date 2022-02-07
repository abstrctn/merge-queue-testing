puts "REF is equal to '#{ENV["REF"]}'" if ENV["REF"]

if ENV["PR_NAME"] && ENV["PR_NAME"].downcase.include?("fail in the queue")
  # REF is equal to 'refs/heads/gh-readonly-queue/main/pr-4-14e30f6938f96698309aec5bb5a293b0f5343e8a'
  if ENV["PR_NAME"].downcase.include?("refs/heads/gh-readonly-queue")
    raise "Manually failing in the merge queue due to PR name" 
  end
elsif ENV["PR_NAME"] && ENV["PR_NAME"].downcase.include?("fail")
  raise "Manually failing PR due to PR name"
end

if ENV["TEST_DELAY_TIME_SECONDS"].to_s.empty?
  puts "Using default sleep time"
  sleep 10
else
  puts "Sleep time set to #{ENV["TEST_DELAY_TIME_SECONDS"].to_i} via repository secret"
  sleep ENV["TEST_DELAY_TIME_SECONDS"].to_i
end
