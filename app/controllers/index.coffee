`import Ember from "ember"`
IndexController = Ember.ArrayController.extend
  sortProperties: ['created_at']
  sortAscending: false

`export default IndexController`
