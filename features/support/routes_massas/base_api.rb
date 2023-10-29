require_relative "base_api"
require "httparty"

class BaseApi
  include HTTParty
  base_uri "https://dev-api-pedidos-qa.via.com.br/api"
end
