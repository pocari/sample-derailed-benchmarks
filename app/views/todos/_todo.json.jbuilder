json.extract! todo, :id, :text, :done, :created_at, :updated_at
json.url todo_url(todo, format: :json)
