# Merge Queue Testing

### Overview
A repo set up to test merge queue

### In use
There is a placeholder CI set up for the main branch in GH actions. It will read the `TEST_DELAY_TIME_SECONDS` actions secret or sleep for a default of 10s. In addition, if you include `fail` in the PR name, the build will fail.
