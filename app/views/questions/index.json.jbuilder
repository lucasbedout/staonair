json.array!(@questions) do |question|
  json.extract! question, :id, :mark, :appreciation
  json.url question_url(question, format: :json)
end
