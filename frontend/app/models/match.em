`import DS from 'ember-data'`

class Match extends DS.Model
  blue_team_score: DS.attr('number')
  red_team_score:  DS.attr('number')

`export default Match`
