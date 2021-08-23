class Order < ApplicationRecord
    belongs_to :property
    has_many :quotes

    enum status: [:created, :in_progress, :completed]

    enum type: [:inspection, :emergency, :safety, :preventative, :electrical, :special, :standard]
end
