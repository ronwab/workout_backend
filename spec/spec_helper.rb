# frozen_string_literal: true

module JsonHelpers
  def response_json
    JSON.parse(response.body, symbolize_names: true)
  end
end

# webmock and vcr
# require 'rspec/rails'
require 'webmock/rspec'
require 'vcr_helper'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include JsonHelpers
end
