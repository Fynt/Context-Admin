gravatarImage = Ember.Component.extend
  tagName: '',
  email: '',
  size: 200,
  gravatarUrl: (->
    email = @get 'email'
    size = @get 'size'
    "http://www.gravatar.com/avatar/#{md5(@get 'email')}?s=#{@get('size')}"
  ).property('email', 'size')

`export default gravatarImage`