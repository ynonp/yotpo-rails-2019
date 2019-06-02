json.extract! ticket, :id, :user_id, :priority, :header, :text, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
