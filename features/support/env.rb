require 'capybara'
require 'capybara/cucumber'

Capybara.configure do |c|
  c.default_driver = :selenium_chrome_headless
end
