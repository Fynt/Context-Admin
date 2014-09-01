`import Ember from "ember"`

BlueprintInput = Ember.Component.extend
  tagName: ''
  type: ''
  field: ''
  label: ''
  store: null
  blueprint: null
  extension_id: ''

  is_text: (->
    @get('type') == 'richtext'
  ).property 'type'

  is_input: (->
    @get('type') == 'text'
  ).property 'type'

  is_date: (->
    @get('type') == 'date'
  ).property 'type'

  is_datetime: (->
    @get('type') == 'datetime'
  ).property 'type'

  is_number: (->
    @get('type') == 'number'
  ).property 'type'

  is_bool: (->
    @get('type') == 'bool'
  ).property 'type'

  is_list: (->
    @get('type') == 'list'
  ).property 'type'

  is_belongs_to: (->
    @get('type') == 'belongs_to'
  ).property 'type'

  relationship_field: (->
    field = @get 'field'
    "#{field}_id"
  ).property 'field'

  list_items: (->
    blueprint = @get 'blueprint'
    blueprint.get('definition')[@get('field')]['values']
  ).property 'field'

  belongs_to_items: (->
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

`export default BlueprintInput`
