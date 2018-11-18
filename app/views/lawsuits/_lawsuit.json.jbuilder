json.extract! lawsuit, :id, :name, :description, :eligibility, :completed, :settlement, :deadline, :created_at, :updated_at
json.url lawsuit_url(lawsuit, format: :json)
