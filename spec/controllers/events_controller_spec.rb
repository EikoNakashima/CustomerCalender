# require 'rails_helper'

# describe EventsController, type: :controller do

#   describe 'GET #new' do
#     it "renders the :new template" do
#       get :new
#       expect(response).to render_template :new
#     end
#   end
#   describe 'GET #edit' do
#     it "assigns the requested event to @event" do
#       evnet = create(:event)
#       get :edit, params: { id: event }
#       expect(assigns(:event)).to eq event
#     end

#     it "renders the :edit template" do
#       event = create(:event)
#       get :edit, params: { id: event }
#       expect(response).to render_template :edit
#     end
#   end
#   describe 'GET #index' do
#     it "populates an array of tweets ordered by created_at DESC" do
#       tweets = create_list(:event, 3) 
#       get :index
#     end

#     it "renders the :index template" do
#     end
#   end
# end