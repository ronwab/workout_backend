# frozen_string_literal: true

class CreatePerson < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.numeric :phone
    end
  end
end
