`import Ember from "ember"`
UsersCreateRoute = Ember.Route.extend

  model: ->
    Ember.RSVP.hash
      groups: @store.find 'group'
      user: @store.createRecord 'user'

`export default UsersCreateRoute`
