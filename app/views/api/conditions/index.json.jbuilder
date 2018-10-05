json.spots @conditions do |condition|
  json.spot_name condition.spot.name
  json.spot_code condition.spot.code
  json.swell_period_s condition.swell_period_s.to_f
  json.swell_height_ft condition.swell_height_ft.to_f
  json.swell_direction condition.swell_direction
  json.wind_speed_mph condition.wind_speed_mph.to_f
  json.wind_direction condition.wind_direction
  json.tide condition.tide
end