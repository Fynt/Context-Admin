ApplicationRoute = Ember.Route.extend
  model: ->
    [
      { name: 'Users', slug: 'users', blueprints: [] }
      { name: 'Pages', slug: 'pages', blueprints: [] }
      { name: 'Store', slug: 'store', blueprints: [] }
    ]

`export default ApplicationRoute`