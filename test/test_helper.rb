ENV['RAILS_ENV'] ||= 'test'

# To generate a test coverage report for the models,
# instead of just the usual `rake` to run tests, use:
# COVERAGE=true rake
require 'simplecov'
if ENV['COVERAGE']
  SimpleCov.start 'rails' do
    add_filter '/controllers|helpers/'
  end
end

# Regular test setup
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'capybara/rails'
require 'capybara/minitest'

# Include sorcery test helpers in controller tests
class ActionController::TestCase
  include Sorcery::TestHelpers::Rails::Integration
  include Sorcery::TestHelpers::Rails::Controller
  include FactoryGirl::Syntax::Methods
end

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
  end
end
