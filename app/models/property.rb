class Property < ApplicationRecord
    include Searchable

    has_many :orders
end
