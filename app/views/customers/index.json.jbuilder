json.array!(@customers) do |customer|
  json.extract! customer, :id, :title, :body  
  json.start customer.start
  json.end customer.end   
  json.url event_url(customer, format: :html) 
end