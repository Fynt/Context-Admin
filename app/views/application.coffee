`import Ember from "ember"`
`import TypeSupportMixin from "../mixins/type-support"`

ApplicationView = Ember.View.extend TypeSupportMixin,
  classNames: ['context-application']
  classTypePrefix: 'context-application'
  #type: 'primary'
    
`export default ApplicationView`