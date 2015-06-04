class Category < ActiveRecord::Base
  has_many :sub_categories

  validates :name,
    presence: true,
    length: { within: 1..100 },
    uniqueness: true

  validates :slug,
    presence: true,
    length: { within: 1..100 },
    uniqueness: true
end
