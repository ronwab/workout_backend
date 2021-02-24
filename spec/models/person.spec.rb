# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person1) { FactoryGirl.create(:person, email_address: 'blah@blah.com', phone: 111 - 222 - 1111) }

  describe 'validates presence' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email_address) }
    it { is_expected.to validate_presence_of(:phone) }
  end

  describe 'validates uniqueness' do
    it { should validate_uniqueness_of(:email_address) }
    it { should validate_uniqueness_of(:phone) }
  end
end
