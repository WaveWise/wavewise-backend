json.spots @spots do |spot|
  json.spot_id spot.id
  json.rating spot.rating
  json.spot_name spot.name
  json.spot_code spot.code
  json.spot_coordinates spot.coordinates
  json.spot_shore_angle spot.shore_angle
  json.swell_period_s spot.condition.swell_period_s.to_f
  json.swell_height_ft spot.condition.swell_height_ft.to_f
  json.swell_direction spot.condition.swell_direction
  json.wind_speed_mph spot.condition.wind_speed_mph.to_f
  json.wind_direction spot.condition.wind_direction
  json.tide_type spot.condition.tide_type
  json.tide_time spot.condition.tide_time
end
