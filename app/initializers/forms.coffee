FormsInitializer = 
  name: 'forms'
  initialize: (container, application) ->
    Ember.EasyForm.Config.registerWrapper 'default',
      inputTemplate: "forms/input"
      
      formClass: 'form-simplified'
      labelClass: 'control-label'
      inputClass: 'form-group'
      # buttonClass: 'btn btn-primary'
      fieldErrorClass: 'has-error'
      errorClass: 'help-block'
    
`export default FormsInitializer`