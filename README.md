# Merge Queue Testing

### Overview:
A repo set up to test merge queue

### In use:
There is a placeholder CI suite set up for the main branch of this repo in GH actions. To help test specific merge queue scenarios, the current implementation functions as follows:

- Test suite 1 (required):
  - The test suite will will read the `TEST_DELAY_TIME_SECONDS` actions secret or sleep for a default of 10s.
  - If you include `fail the pr` in the PR title, the build will fail for the PR and it will never hit the merge queue. 
  - If the PR has an odd number, it will fail in the merge queue. ⚠️
- Test suite 2 (not required)
  - This test suite will always fail, and is not required
