`import DS from 'ember-data'`

class Match extends DS.Model
  blue_team_score: DS.attr('number')
  red_team_score:  DS.attr('number')
  created_by_id: DS.attr('number')
  confirmed_by_id: DS.attr('number')#DS.belongsTo('user')
  confirmed_at: DS.attr('date')
  red_team_player_one: DS.belongsTo('player', async: true)
  red_team_player_two: DS.belongsTo('player')
  blue_team_player_one: DS.belongsTo('player')
  blue_team_player_two: DS.belongsTo('player')
  date: DS.attr('string')
  created_at: DS.attr('date')
  updated_at: DS.attr('date')
  already_ranked: DS.attr('boolean')

`export default Match`
