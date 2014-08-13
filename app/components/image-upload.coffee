ImageUploadComponent = Ember.Component.extend
  container_id: 'upload_controls'

  init_uploader: ->
    uploader = new plupload.Uploader
      runtimes: "html5,html4"
      browse_button: "pickfiles"
      container: @get 'container_id'

      url: 'http://localhost:5000/files'

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
          document.getElementById("filelist").innerHTML = ""
          document.getElementById("uploadfiles").onclick = ->
            uploader.start()
            false

          return

        FilesAdded: (up, files) ->
          plupload.each files, (file) ->
            document.getElementById("filelist")
            .innerHTML += "<div id=\"" + file.id + "\">" + file.name
            + " (" + plupload.formatSize(file.size) + ") <b></b></div>"
            return

          return

        UploadProgress: (up, file) ->
          document.getElementById(file.id).getElementsByTagName("b")[0]
          .innerHTML = "<span>" + file.percent + "%</span>"
          return

        Error: (up, err) ->
          console.log up, err
          document.getElementById("console")
          .innerHTML += "\nError #" + err.code + ": " + err.message
          return

    window.uploader = uploader
    uploader.init()

  didInsertElement: ->
    Ember.run.scheduleOnce "afterRender", this, ->
      @init_uploader()

`export default ImageUploadComponent`
