`import Ember from 'ember';`
`import config from './config/environment';`

`const Router = Ember.Router.extend({ location: config.locationType });`

Router.map ->
  @route 'matches'
#  @route('not_found', { path: '*:'})

`export default Router;`
