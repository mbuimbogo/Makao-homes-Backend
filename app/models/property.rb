class Property < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :clients, through: :comments
    belongs_to :seller
end
