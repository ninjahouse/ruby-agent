require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'

Capybara.register_driver :selenium do |app|
  options = { js_errors: false }
  Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.configure do |c|
  c.default_driver = :selenium_chrome_headless
end
