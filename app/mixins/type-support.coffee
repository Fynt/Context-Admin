`import Ember from "ember"`
TypeSupportMixin= Ember.Mixin.create
  classTypePrefix: Ember.required(String)
  classNameBindings: ['typeClass']
  type: 'default'

  typeClass: ( ->
    type = @get 'type'
    type = 'default' if not type?

    prefix = @get 'classTypePrefix'
    "#{prefix}-#{type}"
  ).property('type').cacheable()

`export default TypeSupportMixin`