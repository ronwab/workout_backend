# frozen_string_literal: true

class PeopleController < ApplicationController
  def create
    new_person = Person.create!(person_params)
    render json: new_person, status: :created
  end

  def index
    all_people = Person.all
    render json: all_people, status: :created
  end

  def show
    render json: find_person, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { message: e.message }, status: 404
  end

  def update
    find_person.update(person_params)
    render json: { message: "Person with id #{find_person[:id]} has been updated" }, status: 200
  rescue ActiveRecord::RecordNotFound => e
    render json: { message: e.message }, status: 404
  end

  def find_person
    @find_person ||= Person.find(params[:id])
  end

  private

  def person_params
    params.permit(:first_name, :last_name, :email_address, :phone)
  end
end
