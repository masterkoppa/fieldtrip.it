json.array!(@field_trips) do |field_trip|
  json.extract! field_trip, :id
  json.url field_trip_url(field_trip, format: :json)
end
