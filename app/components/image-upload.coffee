ImageUploadComponent = Ember.Component.extend
  container_id: 'upload_controls'
  images: []

  init_uploader: ->
    (new plupload.Uploader
      runtimes: "html5"
      drop_element: "drop-target"
      browse_button: "add-image"
      container: @get 'container_id'

      url: 'http://localhost:5000/files/upload'
      autostart: true

      filters:
        max_file_size: "10mb"
        mime_types: [
          {
            title: "Image files"
            extensions: "jpg,gif,png"
          }
        ]

      init:
        PostInit: ->

        FilesAdded: (uploader, files) ->
          console.log "File added!"
          uploader.start()

        UploadProgress: (uploader, file) ->
          #console.log file

        FileUploaded: (uploader, file, info) =>
          if info.status == 200
            image = Ember.$.parseJSON info.response

            images = @get 'images'
            images.pushObject image.file
            console.log images

        UploadComplete: (uploader, data) ->
          #console.log data

        Error: (uploader, err) ->
          console.log "Error", err
    ).init()

  didInsertElement: ->
    Ember.run.scheduleOnce "afterRender", this, ->
      @init_uploader()

`export default ImageUploadComponent`
