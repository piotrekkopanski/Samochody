json.array!(@cars) do |car|
  json.extract! car, :id, :marka, :model, :opis, :rocznik, :cena
  json.url car_url(car, format: :json)
end
