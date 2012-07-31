# =require modules

TIMEOUT = 500 # ms - Used to be 300, but FF was too slow
extendClass 'specs.oojspec.AjaxHelpers', ->
  ajaxServer = null
  initialize: (fakeAjaxServer, options = {})->
    ajaxServer = fakeAjaxServer
  ajaxSettings: -> ajaxServer.ajaxSettings()
  waitsForAjaxRequest: (message = "An AJAX call was expected", \
                        timeout = @timeout or TIMEOUT, extraCondition)->
    @waitsFor message, timeout, ->
      ajaxServer.ajaxCallbacksQueue.length and (not extraCondition or extraCondition.call this)
  waitsForAjaxRequestAnd: (condition, message, timeout)->
    @waitsForAjaxRequest(message, timeout, condition)
  nextRequest: (url, method, format)->
    @checkRequestSettings(url, method, format)
    ajaxServer.processNextRequest()
  checkRequestSettings: (url, method, format)->
    s = @ajaxSettings()
    @expect(s.url).toBe url unless url is undefined
    @expect(s.type).toBe method unless method is undefined
    @expect(s.dataType).toBe format unless format is undefined
  ignoreRequest: (url, method, format)->
    @checkRequestSettings(url, method, format)
    ajaxServer.ignoreNextRequest()
  ignoreAllRequest: -> ajaxServer.ignoreAllRequest()
