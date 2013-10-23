
class Backbone.ScrollTopView extends Backbone.View

  tagName: 'a'

  id: 'scroll-top'

  defaults:
    bottom: '15px'
    right: '15px'

  events:
    'click': 'scrollTop'

  initialize: ->
    @options = _.defaults @options, @defaults
    @$el.css 'bottom', @options.bottom
    @$el.css 'right', @options.right
    @$body = $('body, html')
    @onScroll()

  render: =>
    this

  scrollTop: (e) =>
    e.preventDefault()
    @$body.animate
      scrollTop: 0
    ,
      'fast'
    false

  onScroll: =>
    $doc = $(document)
    added = false
    $doc.scroll (e) =>
      if $doc.scrollTop() > 5
        return if added
        added = true
        @$body.addClass 'scroll'
      else
        added = false
        @$body.removeClass 'scroll'
