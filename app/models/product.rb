class Product < ApplicationRecord
    validates :title, :descript, :amount, :price, presence: true
end
