`import Ember from "ember"`
CapitalizeWord = Ember.Handlebars.makeBoundHelper (word) ->
  if word?
    word[0].toUpperCase() + word[1..-1].toLowerCase()

`export default CapitalizeWord`
