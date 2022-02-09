require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = "http://localhost:30100/" # FIXME: add here the correct IP for the application
end

Capybara.default_max_wait_time = 5