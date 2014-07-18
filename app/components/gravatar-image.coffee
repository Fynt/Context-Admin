gravatarImage = Ember.Component.extend
  tagName: ''
  user: null
  size: 200

  gravatarUrl: (->
    user = @get 'user'
    size = @get 'size'

    email_md5 = ''
    if user
      email_md5 = user.get 'email_md5'

    "http://www.gravatar.com/avatar/#{email_md5}?s=#{@get('size')}"
  ).property('user', 'size')

`export default gravatarImage`
