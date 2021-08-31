# README
# Worlorder API
Welcome to WorkOrder! here you can order any kind of property job that you need done around your house, once you post your order, the thousands of Hearth registered contractors will post quotes for your order allowing you to pick the best offer. Just Search for your address to get started.

To run the backend API:

- make sure to be on Ruby 2.6.3p62
- `brew install elasticsearch`
- run `elasticsearch`
- `bundle install`
- `rails db:create`
- `rails db:migrate`
- `rails db:seed`
- `rails elastic_search:index_models`
- start the server with `rails s`



