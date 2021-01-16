require 'rails_helper'

describe EventsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end

  # describe 'GET #index' do
  #   it "renders the :index template" do
  #     get :index
  #     expect(response).to render_template :index
  #   end
  #   it "returns a 200 response" do
  #     get :index
  #     expect(response).to have_http_status "200"
  #   end
  # end

  describe 'GET #new' , type: :controller do

    context 'log in' do
      it "renders the :new template" do
        sign_in @user
        get :new
        expect(response).to render_template :new
      end
    end
    context 'not log in' do
      it "redirects to new_user_session_path" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#create' , type: :controller do
    let(:params) { { title: "タイトル" , event: attributes_for(:event) } }

    context 'log in' do
      context 'can save' do
        subject {
          post :create,
          params: params
        }
        it 'count up event' do
          sign_in @user
          expect{ subject }.to change(Event, :count).by(1)
        end

        it 'redirects to root_path' do
          sign_in @user
          subject
          expect(response).to redirect_to(root_path)
        end
      end
      context 'can not save' do
        let(:invalid_params) { { event: attributes_for(:event, title: nil) } }

        subject {
          post :create,
          params: invalid_params
        }

        it 'does not count up' do
          sign_in @user
          expect{ subject }.not_to change(Event, :count)
        end

        it 'renders index' do
          sign_in @user
          subject
          expect(response).to redirect_to(new_event_path)
        end
      end
      context 'not log in' do
        it "redirects to new_user_session_path" do
          post :create
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end
  end

  # describe '#destroy' , type: :controller do

  #   context 'log in' do
  #     context 'can destroy' do
       
  #       it 'deletes a event' do
  #         sign_in @user
  #         @event = FactoryBot.create(:event)
  #         expect{ delete :destroy, params: {id: @event.id}
  #       }.to change(@user.events, :count).by(-1)
  #       end

  #       it 'redirects to root_path' do

  #         sign_in @user
  #         delete :destroy
  #         expect(response).to redirect_to(root_path)
  #       end
  #     end

  #     context 'not log in' do
  #       it "redirects to new_user_session_path" do
  #         delete :destroy
  #         expect(response).to redirect_to(new_user_session_path)
  #       end
  #     end
  #   end
  # end

end



