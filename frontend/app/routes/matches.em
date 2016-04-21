`import Ember from 'ember'`

class MatchesRoute extends Ember.Route

  model: (params) ->
    @store.findAll('match')

`export default MatchesRoute`
