`import Ember from 'ember'`

class MatchesRoute extends Ember.Route

  model: (params) ->
    @store.findAll('match', params)

`export default MatchesRoute`
