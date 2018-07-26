require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.javascript_driver = :selenium
Capybara.run_server = false

args = ['--no-default-browser-check']
caps = Selenium::WebDriver::Remote::Capabilities.chrome(
  'chromeOptions' => { 'args' => args }
)
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :remote,
    url: 'http://selenium:4444/wd/hub',
    desired_capabilities: caps
  )
end

Capybara.configure do |c|
  c.default_driver = :selenium
end

Capybara.default_max_wait_time = 10
