class Order < ApplicationRecord
    validate :property_id, :description

    belongs_to :property
    has_many :quotes

    enum order_status: {created: 0, in_progress: 1, completed: 2}
    enum order_type: {inspection: 0, emergency: 1, safety: 2, preventative: 3, electrical: 4, special: 5, standard: 6}

end
