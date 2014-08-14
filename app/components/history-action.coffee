`import Ember from "ember"`
historyAction = Ember.Component.extend
  tagName: 'span'
  classNames: ['history-action']
  action: null

  historyAction: (->
    action = @get 'action'
    switch action
      when 'create' then 'Created'
      when 'publish' then 'Published'
      when 'save' then 'Saved'
      when 'delete' then 'Deleted'
      else action
  ).property('action')

`export default historyAction`
