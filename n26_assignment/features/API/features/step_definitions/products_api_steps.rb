require 'rest_client'

Given(/^I have a api request '(.*)'$/) do |url|
  @end_point = url
end

When(/^I create a valid json body for the post|patch request using the below values:$/) do |table|
  options = table.raw
  @post_request_body = Hash[*options.flatten(1)]
  @post_request_body.each do |k ,v|
    if k == "price"
      @post_request_body[k] = v.to_i
    elsif k == "shipping"
      @post_request_body[k] = v.to_i
    end
  end
end

When(/^I post the request$/) do
  response = RestClient.post @end_point, @post_request_body.to_json, :content_type => :json, :accept => :json
  @product_response_code = response.code
  @product_parsed_json = JSON.parse(response.body)
  $product_id = @product_parsed_json["id"]
end

Then(/^I should get the response code as '(.*?)'$/) do |code|
  if code.to_i == @product_response_code
    puts("The request sent was successful")
  else
    fail("The request sent was unsuccessful with code as #{@product_response_code}")
  end
end

When(/^I patch the request$/) do
  updated_endpoint = @end_point
  updated_endpoint["{id}"] = $product_id.to_s
  response = RestClient.patch updated_endpoint, @post_request_body.to_json, :content_type => :json, :accept => :json
  @product_response_code = response.code
  @product_parsed_json = JSON.parse(response.body)
end

When(/^I get the request$/) do
  response = RestClient.get @end_point
  @product_response_code = response.code
  @product_parsed_json = JSON.parse(response.body)
end

Then(/^the values of the below fields should be updated:$/) do |table|
  options = table.raw
  get_values = Hash[*options.flatten(1)]
  get_values.each do |k ,v|
    if k == "name"
      if @product_parsed_json[k] == v
        puts ("The updated value #{@product_parsed_json[k]} matches with #{v}")
      else
        fail("The value #{@product_parsed_json[k]} do not match with #{v}")
      end
    elsif k == "manufacturer"
      if @product_parsed_json[k] == v
        puts ("The updated value #{@product_parsed_json[k]} matches with #{v}")
      else
        fail("The value #{@product_parsed_json[k]} do not match #{v}")
      end
    end
  end

end

When(/^I delete the request$/) do
  response = RestClient.delete @end_point
  @product_response_code = response.code
  @product_parsed_json = JSON.parse(response.body)
end

Then(/^the Json reponse should have '(.*?)' entries$/) do |entries|
  response = RestClient.get @end_point
  @product_response_code = response.code
  @product_parsed_json = JSON.parse(response.body)
  json_size = JSON.parse(response.body)["data"].size
  if json_size == entries.to_i
    puts("The get request query executed successfully")
  else
    fail("The get request query executed unsuccessfully")
  end
end

Then(/^I verify if the price of the first product is "(.*?)"$/) do |price|
  response = RestClient.get @end_point
  @product_response_code = response.code
  @product_parsed_json = JSON.parse(response.body)
  json_size = @product_parsed_json["data"].first
  if json_size["price"] == price.to_f
      puts("The get request query executed successfully")
    else
      fail("The get request query executed unsuccessfully")
    end
end