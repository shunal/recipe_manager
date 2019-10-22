class Recipe < ApplicationRecord
    has_many :ingredients
    has_many :users, through: :ingredients
end
