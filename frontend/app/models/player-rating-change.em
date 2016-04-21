`import DS from 'ember-data'`

class PlayerRatingChange extends DS.Model
  rating_points_difference: DS.attr('number')
  player: DS.belongsTo('player')
  match: DS.belongsTo('match')


`export default PlayerRatingChange`
