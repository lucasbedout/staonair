json.array!(@notations) do |notation|
  json.extract! notation, :id, :student, :mark, :results, :appreciation
  json.url notation_url(notation, format: :json)
end
