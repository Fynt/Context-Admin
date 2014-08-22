`import Ember from "ember"`
GroupsCreateRoute = Ember.Route.extend

  model: ->
    @store.createRecord 'group'

`export default GroupsCreateRoute`
