@api
Feature: Test RESTful API in Best Buy API playground

  Scenario: To Test creation of Products - Post Request
    Given I have a api request 'http://localhost:3030/products'
    When I create a valid json body for the post request using the below values:
      | name         | demo_value_name                                                                                                |
      | type         | demo_value_type                                                                                                |
      | price        | 10.5                                                                                                           |
      | shipping     | 0                                                                                                              |
      | upc          | 039800013200                                                                                                   |
      | description  | Automated request to create a product                                                                          |
      | manufacturer | demo_value_manufacturer                                                                                        |
      | model        | MN2400B4Z                                                                                                      |
      | url          | http://www.bestbuy.com/site/energizer-max-batteries-aa-4-pack/150115.p?id=1051384046217&skuId=150115&cmp=RMXCC |
      | image        | http://img.bbystatic.com/BestBuy_US/images/products/4853/48530_sa.jpg                                          |
    And I post the request
    Then I should get the response code as '201'


  Scenario:  To test the update of Products - Patch Request
    Given I have a api request 'http://localhost:3030/products/{id}'
    When I create a valid json body for the patch request using the below values:
      | name         | demo_value_updated                                                                                             |
      | type         | demo_value_type                                                                                                |
      | price        | 10.5                                                                                                           |
      | shipping     | 0                                                                                                              |
      | upc          | 039800013200                                                                                                   |
      | description  | Automated request to create a product                                                                          |
      | manufacturer | demo_value_manufacturer_updated                                                                                |
      | model        | MN2400B4Z                                                                                                      |
      | url          | http://www.bestbuy.com/site/energizer-max-batteries-aa-4-pack/150115.p?id=1051384046217&skuId=150115&cmp=RMXCC |
      | image        | http://img.bbystatic.com/BestBuy_US/images/products/4853/48530_sa.jpg                                          |
    And I patch the request
    Then I should get the response code as '200'


  Scenario: To get the updated value of Products - Get Request
    Given I have a api request 'http://localhost:3030/products/{id}'
    When I get the request
    Then the values of the below fields should be updated:
      | name         | demo_value_updated              |
      | manufacturer | demo_value_manufacturer_updated |
    And I should get the response code as '200'


  Scenario: To delete the Product - Delete Request (Failing the test case by design by doing a get prodcuts for a deleted item)
    Given I have a api request 'http://localhost:3030/products/{id}'
    When I delete the request
    Then I should get the response code as '200'
    And I get the request

  Scenario: Get all products, limit to 20
    Given I have a api request 'http://localhost:3030/products?$limit=20'
    When I get the request
    Then the Json reponse should have '20' entries

  Scenario: Sort price by descending value of the price
    Given I have a api request 'http://localhost:3030/products?$sort[price]=-1'
    When I get the request
    Then I verify if the price of the first product is "27999.98"