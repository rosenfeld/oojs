# =require modules

TIMEOUT = 500 # ms - Used to be 300, but FF was too slow
extendClass 'specs.jasmine.AjaxHelpers', (self)->
  ajaxServer = null
  initialize: (fakeAjaxServer, options={})->
    ajaxServer = fakeAjaxServer
    TIMEOUT = options.timeout if options.timeout
  ajaxSettings: -> ajaxServer.ajaxSettings()
  waitsFor: (condition, message="waited event didn't happen", timeout=TIMEOUT)->
    waitsFor (-> condition.call self), message, timeout
  waitsForAjaxRequest: (message = "An AJAX call was expected", timeout=TIMEOUT, extraCondition)->
    @waitsFor (-> ajaxServer.ajaxCallbacksQueue.length and
      (not extraCondition or extraCondition.call self)), message, timeout
  waitsForAjaxRequestAnd: (condition, message, timeout)->
    @waitsForAjaxRequest(message, timeout, condition)
  nextRequest: (url, method, format)->
    @checkRequestSettings(url, method, format)
    ajaxServer.processNextRequest()
  checkRequestSettings: (url, method, format)->
    s = @ajaxSettings()
    expect(s.url).toBe url unless url is undefined
    expect(s.type).toBe method unless method is undefined
    expect(s.dataType).toBe format unless format is undefined
  ignoreRequest: (url, method, format)->
    @checkRequestSettings(url, method, format)
    ajaxServer.ignoreNextRequest()

