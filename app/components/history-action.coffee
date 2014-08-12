`import Ember from "ember"`
historyAction = Ember.Component.extend
  tagName: 'span'
  classNames: ['history-action']
  action: null

  historyAction: (->
    action = @get 'action'

    if action == 'save'
      return 'saved'
    else
      return action
  ).property('action')

`export default historyAction`
