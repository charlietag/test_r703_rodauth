json.extract! book, :id, :name, :content, :price, :created_at, :updated_at
json.url book_url(book, format: :json)
