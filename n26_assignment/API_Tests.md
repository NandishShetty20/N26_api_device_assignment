# API tests Overview

## Test Cases

1. To test the creation of a Product and verifying the response code to be '201'.
2. To Update the created product and verifying the response code to be '200'.
3. To check the updated product.
4. To deletet the created product.(The test case fails as I am adding a get request for the deleted product).

## Framework Architecture

I have followed a very simple architecture for lack of time to finish the API tests. I have my front end cucumber code which has the data table and all the required data for a request. The code for the cucumber steps is written in the step definitions which converts the data table into a valid json body and executes all the requests accordingly.
