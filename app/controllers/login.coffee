LoginController = Ember.Controller.extend
  actions:
    close: ->
      @send 'closeModal'

    login: ->
      data =
        email: @get 'email'
        password: @get 'password'
      console.log data

      @send 'closeModal'

`export default LoginController`
