# Grape Validation issue

My problem: I want to ensure that a nested parameter matches a given route parameter. As far as I can tell, the route parameters are not available inside the nested param's validator.

## Instructions

1. clone repo
1. `bundle` to install applicable gems
1. `rackup` to run the server
1. Navigate to `http://localhost:9292/foo/?outer[inner]=foo`