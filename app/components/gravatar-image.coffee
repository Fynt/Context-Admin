gravatarImage = Ember.Component.extend
  tagName: ''
  user: null
  hash: ''
  size: 200

  gravatarUrl: (->
    "http://www.gravatar.com/avatar/#{@get('hash')}?s=#{@get('size')}"
  ).property('hash', 'size')

`export default gravatarImage`
