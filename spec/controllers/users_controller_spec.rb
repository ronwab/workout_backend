# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'users#create' do
    user_params = { username: 'ronwab', password: '123456', confirm_password: '123456', email_address: 'ronw@test.com', first_name: 'Ron', last_name: 'Wab', email_address: 'ronwab@yahoo.com', phone: 1_234_555, address: '1234 boom', city: 'Atlanta', state: 'Georgia', zipcode: 123_455 }
    it 'creates a users' do
      expect do
        post :create, { params: user_params }
      end.to change { User.count }.by(1)

      expect(response.status).to eq(201)
    end
  end

  describe 'users/index' do
    let(:test_users) { FactoryGirl.create_list(:user, 5) }
    it 'returns all users' do
      get :index
      expect(response.status).to eq(200)
      expect(test_users.count).to eq(5)
    end
  end

  describe 'users/show' do
    let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }

    it 'returns the correct user' do
      get :show, params: { id: user1.username, password: user1.password }
      response_body = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(response_body['id']).to eq(user1.id)
    end

    it 'displays an error when user is not found' do
      get :show, params: { id: 'Nope ' }
      expect(response.status).to eq(404)
      response_body = JSON.parse(response.body)
      response_body['message'].should eq("Couldn't find User with 'id'=12")
    end
  end

  describe 'user/update' do
    let(:user) { FactoryGirl.create(:user, id: 2, first_name: 'Banana', username: 'blah') }
    it 'updates the user' do
      put :update,  params: { username: user.username, first_name: 'lalala', password: user.password }

      user.reload
      expect(response.status).to eq(200)
      expect(user.first_name).to eq('lalala')
    end
    it 'displays an error if record is not found' do
      # binding.pry
      put :update,  params: { username: 'kubaf', first_name: 'lalala', password: user.password }
      user.reload
      expect(response.status).to eq(404)
      response_body = JSON.parse(response.body)
      expect(response_body['message']).to eq("Couldn't find user with 'id'=23")
    end
  end
end
