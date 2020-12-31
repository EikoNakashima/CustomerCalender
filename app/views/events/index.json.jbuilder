json.array!(@events) do |event|
  if current_user.id == event.user_id
    json.extract! event, :id, :title, :body  
    json.start event.start_time
    json.end event.end_time   
    json.url event_url(event, format: :html)
  end 
end