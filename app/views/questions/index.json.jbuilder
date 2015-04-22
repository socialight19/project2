json.array!(@questions) do |question|
  json.extract! question, :id, :question_asked, :user_id
  json.url question_url(question, format: :json)
end
