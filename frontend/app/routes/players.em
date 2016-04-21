`import Ember from 'ember'`

class MatchesRoute extends Ember.Route

  model: (params) ->
    @store.findAll('player', params)

`export default MatchesRoute`
