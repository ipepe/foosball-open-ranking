`import Ember from 'ember'`

class ApplicationRoute extends Ember.Route

  actions:
    transitionTo: ->
      @transitionTo.apply(this, arguments)

`export default ApplicationRoute`
