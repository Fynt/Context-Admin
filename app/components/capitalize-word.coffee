capitalizeWord = Ember.Component.extend
  word: ''

  capitalizeWord: (->
    @word[0].toUpperCase() + @word[1..-1].toLowerCase()
  ).property 'string'

`export default capitalizeWord`
