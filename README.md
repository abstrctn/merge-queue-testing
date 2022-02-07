# Merge Queue Testing

### Overview
A repo set up to test merge queue

### In use
There is a placeholder CI set up for the main branch of this repo in GH actions. It will read the `TEST_DELAY_TIME_SECONDS` actions secret or sleep for a default of 10s. In addition, if you include `fail` in the PR name, the build will fail for the PR. If you include `fail in the queue` in the PR name, the build will pass in the PR and then fail in the merge queue.

There is a second test in the test suite as well, which currently will always fail and is intentionally not required.
