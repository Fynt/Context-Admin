`import Ember from "ember"`
relativeTime = Ember.Component.extend
  tagName: 'span'
  classNames: ['relative-time']
  date: ''
  relativeTime: (->
    date = @get 'date'

    # Trying to only return a relative time if there's a date.
    if date?
      return moment(date).fromNow()
    else
      #TODO Is there a better thing to return?
      return '-'
  ).property('date')

`export default relativeTime`
