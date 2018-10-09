# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Condition.destroy_all
Spot.destroy_all

Spot.create!(
  id: 1,
  name: 'Surf City',
  code: 'sc',
  coordinates: '34.366306,-77.628761',
  shore_angle: 'null'
)

Spot.create!(
  id: 2,
  name: 'Wrightsville Beach - North End',
  code: 'wb_ne',
  coordinates: '34.2358,-77.7754',
  shore_angle: 'null'
)

Spot.create!(
  id: 3,
  name: 'Wrightsville Beach - South End',
  code: 'wb_se',
  coordinates: '34.1935,-77.8050 ',
  shore_angle: 'null'
)

Spot.create!(
  id: 4,
  name: 'Carolina Beach',
  code: 'cb',
  coordinates: '34.0570,-77.8814',
  shore_angle: 'null'
)

Condition.create!(
  id: 1,
  spot_id: 1,
  swell_period_s: 6.7,
  swell_height_ft: 3.4,
  swell_direction: 'SE',
  wind_speed_mph: 6,
  wind_direction: 'SE',
  tide: 'null'
)

Condition.create!(
  id: 2,
  spot_id: 2,
  swell_period_s: 12.1,
  swell_height_ft: 1.4,
  swell_direction: 'N',
  wind_speed_mph: 2,
  wind_direction: 'E',
  tide: 'null'
)

Condition.create!(
  id: 3,
  spot_id: 3,
  swell_period_s: 5.2,
  swell_height_ft: 1.2,
  swell_direction: 'S',
  wind_speed_mph: 3,
  wind_direction: 'S',
  tide: 'null'
)

Condition.create!(
  id: 4,
  spot_id: 4,
  swell_period_s: 10.8,
  swell_height_ft: 0.4,
  swell_direction: 'SE',
  wind_speed_mph: 5,
  wind_direction: 'SE',
  tide: 'null'
)
