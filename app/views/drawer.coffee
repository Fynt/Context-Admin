`import Ember from "ember"`
ContextDrawer = Ember.View.extend
  classNames: ['context-drawer']
  classNameBindings: ['hasHeader', 'hasFooter']
  hasHeader: false
  hasFooter: false
    
  checkForHeader: ->
    header = @.$ '> .context-header'
    @set 'hasHeader', header.length > 0
  
  checkForFooter: ->
    footer= @.$ '> .context-footer'
    @set 'hasFooter', footer.length > 0
  
  didInsertElement: ->
    @checkForHeader()
    @checkForFooter()

`export default ContextDrawer`