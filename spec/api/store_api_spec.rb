=begin
#OpenAPI Petstore

#This is a sample server Petstore server. For this sample, you can use the api key `special-key` to test the authorization filters.

OpenAPI spec version: 1.0.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 3.2.1

=end

require 'spec_helper'
require 'json'

# Unit tests for OpenapiClient::StoreApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'StoreApi' do
  before do
    # run before each test
    @instance = OpenapiClient::StoreApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of StoreApi' do
    it 'should create an instance of StoreApi' do
      expect(@instance).to be_instance_of(OpenapiClient::StoreApi)
    end
  end

  # unit tests for delete_order
  # Delete purchase order by ID
  # For valid response try integer IDs with value &lt; 1000. Anything above 1000 or nonintegers will generate API errors
  # @param order_id ID of the order that needs to be deleted
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_order test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_inventory
  # Returns pet inventories by status
  # Returns a map of status codes to quantities
  # @param [Hash] opts the optional parameters
  # @return [Hash<String, Integer>]
  describe 'get_inventory test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_order_by_id
  # Find purchase order by ID
  # For valid response try integer IDs with value &lt;&#x3D; 5 or &gt; 10. Other values will generated exceptions
  # @param order_id ID of pet that needs to be fetched
  # @param [Hash] opts the optional parameters
  # @return [Order]
  describe 'get_order_by_id test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for place_order
  # Place an order for a pet
  # @param order order placed for purchasing the pet
  # @param [Hash] opts the optional parameters
  # @return [Order]
  describe 'place_order test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end