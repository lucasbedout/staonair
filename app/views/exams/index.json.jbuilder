json.array!(@exams) do |exam|
  json.extract! exam, :id, :course, :exam_type, :nb_questions, :average, :max, :min
  json.url exam_url(exam, format: :json)
end
