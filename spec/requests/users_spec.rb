require 'rails_helper'

RSpec.describe "Users", type: :request do
  # describe "GET /index" do
  #
  # end
  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_params) { FactoryBot.attributes_for(:user, role: 'admin') }
      let(:create_action) { post '/users', params: { user: valid_params } }

      it 'creates a new user' do
        expect { User.create(valid_params)}.to change(User, :count).by(1)
      end


      it 'redirects to sign in page' do
        create_action
        expect(response).to redirect_to(users_path)
      end
    end
  end
  end
