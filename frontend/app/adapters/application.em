`import DS from 'ember-data'`

ApplicationAdapter = DS.RESTAdapter.extend
  namespace: 'api/v2'

`export default ApplicationAdapter`
