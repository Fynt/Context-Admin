ImageUploadComponent = Ember.Component.extend
  container_id: 'form#image_upload'

  init_uploader: ->
    dropzone = new Dropzone @get 'container_id'
    console.log dropzone

  didInsertElement: ->
    Dropzone.autoDiscover = false
    Ember.run.scheduleOnce "afterRender", this, ->
      @init_uploader()

`export default ImageUploadComponent`
