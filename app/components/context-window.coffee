ContextWindow = Ember.Component.extend
  classNames: ['context-window']
  classNameBindings: ['hasDrawer', 'hasHeader', 'hasFooter']
  hasDrawer: false
  hasHeader: false
  hasFooter: false
  
  checkForDrawer: -> 
    drawer = @.$ '> .context-drawer'
    @set 'hasDrawer', drawer.length > 0
    
  checkForHeader: ->
    header = @.$ '> .context-header'
    @set 'hasHeader', header.length > 0
  
  checkForFooter: ->
    footer= @.$ '> .context-footer'
    @set 'hasFooter', footer.length > 0
  
  didInsertElement: ->
    @checkForDrawer()
    @checkForHeader()
    @checkForFooter()

`export default ContextWindow`