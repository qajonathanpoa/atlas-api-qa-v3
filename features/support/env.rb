require "allure-cucumber"
require "kafka"
require "rspec"
require "httparty"
require "mongo"
require_relative "helpers"

World(HELPERS)

AllureCucumber.configure do |config|
  config.results_directory = "/reports"
  config.clean_results_directory = true
end
