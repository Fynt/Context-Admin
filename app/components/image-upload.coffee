ImageUploadComponent = Ember.Component.extend
  container_id: 'div#image_upload'

  init_uploader: ->
    dropzone = new Dropzone @get 'container_id',
      url: '/wut'
      #url: "http://localhost:5000/images/upload"

    console.log dropzone

  didInsertElement: ->
    Ember.run.scheduleOnce "afterRender", this, ->
      @init_uploader()

`export default ImageUploadComponent`
