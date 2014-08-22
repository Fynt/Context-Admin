`import Ember from "ember"`
IndexController = Ember.ArrayController.extend
  needs: ['application']
  sortProperties: ['created_at']
  sortAscending: false

`export default IndexController`
