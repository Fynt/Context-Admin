# REST Adapter
ContextRESTAdapter = DS.RESTAdapter.reopen
  host: 'http://localhost:5000'

# Fixture Adapter
ContextFixtureAdapter = DS.FixtureAdapter.extend
  queryFixtures: (records, query, type) ->
    records.filter (record) ->
      for key of query
        continue  unless query.hasOwnProperty(key)
        value = query[key]
        return false  if record[key] isnt value
      true

#TODO: Switch between the two following adapters based on environment.
`export default ContextRESTAdapter`
#`export default ContextFixtureAdapter`
