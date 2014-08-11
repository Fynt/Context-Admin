TRANSLATIONS = 
  auth:
    login:
      heading: 'Log in'
      email:
        label: 'Email Address'
        placeholder: 'your@email.com'
      password:
        label: 'Password'
        placeholder: 'Keep it secret, keep it safe'
      button: 'Log In'
      errors:
        invalid: "Email and password are required."
        failed: "Authentication failed."

I18NInitializer = 
  name: 'i18n'
  initialize: (container, app) ->
    Ember.FEATURES.I18N_TRANSLATE_HELPER_SPAN = false
    Ember.I18n.I18N_COMPILE_WITHOUT_HANDLEBARS = true
    Ember.I18n.translations = TRANSLATIONS

`export default I18NInitializer`