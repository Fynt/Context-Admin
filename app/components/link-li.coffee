`import Ember from "ember"`
LinkLiComponent = Ember.Component.extend
  tagName: 'li'
  classNameBindings: ['active']
  active: (->
    @get('childViews').anyBy('active')
  ).property 'childViews.@each.active'

`export default LinkLiComponent`