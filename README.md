# Merge Queue Testing

### Overview:
A repo set up to test merge queue

### In use:
There is a placeholder CI suite set up for the main branch of this repo in GH actions. To help test specific merge queue scenarios, the current implementation functions as follows:

- Test suite 1:
  - The test suite will will read the `TEST_DELAY_TIME_SECONDS` actions secret or sleep for a default of 10s.
  - If you include `fail the pr` in the PR title, the build will fail for the PR and it will never hit the merge queue.
  - If the PR has an odd number and `FAIL_ODD_PRS` is set to `true`, it will fail in the merge queue. ⚠️
- Test suite 2:
  - This test suite is not required
  - The test will respect the same `TEST_DELAY_TIME_SECONDS` env var as the other test suites
  - If `NOT_REQUIRED_TEST_FAILING` is set to `true`, this test will always fail (after the delay time)
- Test suite 3
  - This test suite runs a math calculation to enable more complex conflicts between PRs
  - The test will respect the same `TEST_DELAY_TIME_SECONDS` env var as the other test suites
  - To run this test locally, `bundle install` then use `bundle exec ruby ./test/math_test.rb`
