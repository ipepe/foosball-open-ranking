`import Ember from 'ember'`

class MatchesController extends Ember.Controller
  currentPathChanged: ( ->
    window.scrollTo(0,0)
    document.title = "#{@currentPath.toString().split('.')[0].capitalize()} - Foosball OPR"
  ).observes('currentPath')

`export default MatchesController`
