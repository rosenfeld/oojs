# =require jasmine-jquery

jasmine.JQuery.matchersClass.toHaveCss = (css)->
  (return false unless @actual.css(prop) is value) for prop, value of css
  true

