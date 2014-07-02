ContextFixtureAdapter = DS.FixtureAdapter.extend
  queryFixtures: (fixture, query, type) ->
    fixture.filter (item) ->
      for prop of query
        return false  unless item[prop] is query[prop]
      true

`export default ContextFixtureAdapter`
