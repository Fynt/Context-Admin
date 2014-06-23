relativeTime = Ember.Component.extend
  tagName: 'span'
  classNames: ['relative-time']
  date: ''
  relativeTime: (->
    moment(@get 'date').fromNow()
  ).property('date')

`export default relativeTime`