# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  describe 'people#create' do
    person_params = { first_name: 'Ron', last_name: 'Wab', email_address: 'ronwab@yahoo.com', phone: 1_234_555 }
    it 'creates a person' do
      expect do
        post :create, { params: person_params }
      end.to change { Person.count }.by(1)

      expect(response.status).to eq(201)
    end
  end

  describe 'people/index' do
    let(:test_people) { FactoryGirl.create_list(:person, 5) }
    it 'returns all people' do
      get :index
      # binding.pry
      expect(response.status).to eq(201)
      expect(test_people.count).to eq(5)
    end
  end

  describe 'people/show' do
    let(:person1) { FactoryGirl.create(:person) }
    let(:person2) { FactoryGirl.create(:person) }

    it 'returns the correct person' do
      get :show, params: { id: person1.id }
      response_body = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(response_body['id']).to eq(person1.id)
    end

    it 'displays an error when person is not found' do
      get :show, params: { id: 12 }
      expect(response.status).to eq(404)
      response_body = JSON.parse(response.body)
      response_body['message'].should eq("Couldn't find Person with 'id'=12")
    end
  end

  describe 'people/update' do
    let(:person) { FactoryGirl.create(:person, id:2, first_name: "Banana")}
    it "updates the person" do
      put :update,  params: { id: person.id, first_name: "lalala"  }
      person.reload
      expect(response.status).to eq(200)
      expect(person.first_name).to eq("lalala")
    end
    it "displays an error if record is not found" do

      put :update,  params: { id: 23, first_name: "lalala"  }
      person.reload
      expect(response.status).to eq(404)
      response_body =JSON.parse(response.body)
      expect(response_body['message']).to eq("Couldn't find Person with 'id'=23")
    end
  end
end
