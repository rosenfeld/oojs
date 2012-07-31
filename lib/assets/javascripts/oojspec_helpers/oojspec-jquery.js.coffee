$ = jQuery # just to make sure

assertions = oojspec.assertions

addAssertion = (name, assertion)->
  assert = assertion.assert
  assertion.assert = ->
    if arguments.length < assert.length
      msg = "[#{name}] Expected to receive at least #{assert.length} argument"
      msg += 's' if assert.length > 1
      assertions.fail msg
      return
    result = assert.apply this, arguments
    @actual = $toString(@actual) if @actual instanceof jQuery
    result
  assertions.add name, assertion

@oojs or= {}

$toString = ($element)->
  return toHtml($element) if oojs.debugJQuery
  $element.map((i, el)-> el.toString()).toArray().join '; '

toHtml = ($element)->
  $element.map((i, el)-> $('<div/>').append($(el).clone()).html()).toArray().join ';\n\n'

browserTagCaseIndependentHtml = (html)-> $('<div/>').append(html).html()

addAssertion 'hasClass',
  assert: (@actual, @className)-> $(actual).hasClass className
  assertMessage: 'Expected ${actual} to have class ${className}.'
  refuteMessage: 'Expected ${actual} not to have class ${className}.'
  expectation: 'toHaveClass'

addAssertion 'isVisible',
  assert: (@actual)-> $(actual).is(':visible')
  assertMessage: 'Expected ${actual} to be visible.'
  refuteMessage: 'Expected ${actual} not to be visible.'
  expectation: 'toBeVisible'

addAssertion 'isHidden',
  assert: (@actual)-> $(actual).is(':hidden')
  assertMessage: 'Expected ${actual} to be hidden.'
  refuteMessage: 'Expected ${actual} not to be hidden.'
  expectation: 'toBeHidden'

addAssertion 'isSelected',
  assert: (@actual)-> $(actual).is(':selected')
  assertMessage: 'Expected ${actual} to be selected.'
  refuteMessage: 'Expected ${actual} not to be selected.'
  expectation: 'toBeSelected'

addAssertion 'isChecked',
  assert: (@actual)-> $(actual).is(':checked')
  assertMessage: 'Expected ${actual} to be checked.'
  refuteMessage: 'Expected ${actual} not to be checked.'
  expectation: 'toBeChecked'

addAssertion 'isEmpty',
  assert: (@actual)-> $(actual).is(':empty')
  assertMessage: 'Expected ${actual} to be empty.'
  refuteMessage: 'Expected ${actual} not to be empty.'
  expectation: 'toBeEmpty'

addAssertion 'exists',
  assert: (@actual)-> $(actual).length
  assertMessage: 'Expected ${actual} to exist.'
  refuteMessage: 'Expected ${actual} not to exist.'
  expectation: 'toExist'

addAssertion 'hasAttr',
  assert: (@actual, @attribute, @expected)-> hasProperty actual.attr(attribute), expected
  assertMessage: 'Expected attribute ${attribute} to be ${expected} for ${actual}.'
  refuteMessage: 'Expected attribute ${attribute} not to be ${expected} for ${actual}.'
  expectation: 'toHaveAttr'

addAssertion 'hasProp',
  assert: (@actual, @property, @expected)-> hasProperty actual.prop(attribute), expected
  assertMessage: 'Expected property ${property} to be ${expected} for ${actual}.'
  refuteMessage: 'Expected property ${property} not to be ${expected} for ${actual}.'
  expectation: 'toHaveProp'

addAssertion 'hasCss',
  assert: (@actual, @css)->
    return false for prop, value of css when @actual.css(prop) isnt value
    true
  assertMessage: 'Expected ${actual} to have css ${css}.'
  refuteMessage: 'Expected ${actual} not to have css ${css}.'
  expectation: 'toHaveCss'

addAssertion 'hasId',
  assert: (@actual, @id)-> hasProperty actual.attr('id') is id
  assertMessage: 'Expected ${actual} to have id ${id}.'
  refuteMessage: 'Expected ${actual} not to have id ${id}.'
  expectation: 'toHaveId'

addAssertion 'hasHtml',
  assert: (@actual, @html)-> actual.html() is browserTagCaseIndependentHtml html
  assertMessage: 'Expected ${actual} to have html ${html}.'
  refuteMessage: 'Expected ${actual} not to have html ${html}.'
  expectation: 'toHaveHtml'

addAssertion 'hasText',
  assert: (@actual, @text)->
    trimmedText = $.trim actual.text()
    return text.test trimmedText if text?.test
    trimmedText is text
  assertMessage: 'Expected ${actual} to have text ${text}.'
  refuteMessage: 'Expected ${actual} not to have text ${text}.'
  expectation: 'toHaveText'

addAssertion 'hasValue',
  assert: (@actual, @value)-> actual.val() is value
  assertMessage: 'Expected ${actual} to have value ${value}.'
  refuteMessage: 'Expected ${actual} not to have value ${value}.'
  expectation: 'toHaveValue'

addAssertion 'hasData',
  assert: (@actual, @key, @value)-> actual.data(key) is value
  assertMessage: 'Expected ${key} data to be ${value} for ${actual}.'
  refuteMessage: 'Expected ${key} data not to be ${value} for ${actual}.'
  expectation: 'toHaveData'

addAssertion 'isSelector', # TODO: override toBe?
  assert: (@actual, @selector)-> actual.is selector
  assertMessage: 'Expected ${actual} to be ${selector}.'
  refuteMessage: 'Expected ${actual} not to be ${selector}.'
  expectation: 'toBeSelector'

addAssertion 'containsSelector', # TODO: override contains?
  assert: (@actual, @selector)-> actual.find(selector).length
  assertMessage: 'Expected ${actual} to contain ${selector}.'
  refuteMessage: 'Expected ${actual} not to contain ${selector}.'
  expectation: 'toContainSelector'

addAssertion 'isDisabled',
  assert: (@actual)-> actual.is ':disabled'
  assertMessage: 'Expected ${actual} to be disabled.'
  refuteMessage: 'Expected ${actual} not to be disabled.'
  expectation: 'toBeDisabled'

addAssertion 'isFocused',
  assert: (@actual)-> actual.is ':focus'
  assertMessage: 'Expected ${actual} to be focused.'
  refuteMessage: 'Expected ${actual} not to be focused.'
  expectation: 'toBeFocused'

addAssertion 'handle',
  assert: (@actual, @event)-> actual.data('events')?[event].length
  assertMessage: 'Expected ${actual} to handle ${event}.'
  refuteMessage: 'Expected ${actual} not to handle ${event}.'
  expectation: 'toHandle'

addAssertion 'handleWith',
  assert: (@actual, @event, @handler)->
    stack = actual.data('events')[event]
    return true for ev in stack when ev.handler is handler
    false
  assertMessage: 'Expected ${actual} to handle ${event} with ${handler}.'
  refuteMessage: 'Expected ${actual} not to handle ${event} with ${handler}.'
  expectation: 'toHandle'

hasProperty = (actualValue, expectedValue)->
  return actualValue isnt undefined if expectedValue is undefined
  actualValue is expectedValue
