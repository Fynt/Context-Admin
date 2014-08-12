blueprintInput = Ember.Component.extend
  tagName: ''
  type: ''
  field: ''
  label: ''
  store: null
  extension_id: ''

  is_text: (->
    @get('type') == 'richtext'
  ).property('type')

  is_select: (->
    @get('type') == 'belongs_to'
  ).property('type')

  is_input: (->
    @get('type') != 'richtext' and @get('type') != 'belongs_to'
  ).property('type')

  select_field: (->
    field = @.get 'field'
    "#{field}_id"
  ).property('field')

  select_items: (->
    store = @get 'store'
    extension_id = @get 'extension_id'
    relationship = @get 'field'

    related_type = "#{extension_id}/#{relationship}"
    try
      if store.modelFor related_type
        return store.find related_type
    catch
      return []
  ).property('field', 'extension_id')

`export default blueprintInput`
