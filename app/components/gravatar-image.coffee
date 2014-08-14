`import Ember from "ember"`
gravatarImage = Ember.Component.extend
  tagName: ''
  default: ''
  user: null
  email: null
  hash: ''
  size: 200

  gravatarUrl: ( ->
    url = "http://www.gravatar.com/avatar/#{@get('hash')}?s=#{@get('size')}"
    if @get 'default' then url += "&d=#{@get('default')}"
    url
  ).property('hash', 'size')

`export default gravatarImage`
