class Recipe < ApplicationRecord
    scope :by_date, -> {order(created_at: 'asc') }
    scope :by_category, ->(name) { joins(:category).where(categories: {name: name.titleize})}
    has_many :ingredients
    belongs_to :category
    belongs_to :user
    validates :name, presence: true


    # def self.by_category(name)
    #     joins(:category).where(categories: { name: name.titleize})
    # end
end
