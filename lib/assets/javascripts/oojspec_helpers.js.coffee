# =require_tree ./oojspec_helpers

oojspec.assertions.add 'undefined', # simetric to 'toBeDefined'
  assert: (@actual)-> @actual is undefined
  assertMessage: 'Expected ${actual} to be undefined.'
  refuteMessage: 'Expected ${actual} not to be undefined.'
  expectation: 'toBeUndefined'
