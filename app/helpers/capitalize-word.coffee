CapitalizeWord = Ember.Handlebars.makeBoundHelper (word) ->
  word[0].toUpperCase() + word[1..-1].toLowerCase()

`export default CapitalizeWord`
