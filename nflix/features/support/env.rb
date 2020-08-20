require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"

require_relative "helpers"

World(Helpers)

Capybara.configure do |config|
    config.default_driver = :selenium_chrome    #Chrome
    #config.default_driver = :selenium          #Firefox
    config.app_host = "http://192.168.99.100:8080" # Docker ToolBox no Windows
end