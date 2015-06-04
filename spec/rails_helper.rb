ENV["RAILS_ENV"] ||= "test"

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require File.expand_path("../../config/environment", __FILE__)
require "spec_helper"
require "rspec/rails"
require "capybara/rails"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include ActionView::Helpers::TranslationHelper
  config.include FactoryGirl::Syntax::Methods
  config.include Formulaic::Dsl, type: :feature

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
end
