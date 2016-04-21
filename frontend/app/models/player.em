`import DS from 'ember-data'`

class Player extends DS.Model
  nickname: DS.attr('string')
  rating_points: DS.attr('number')

`export default Player`
