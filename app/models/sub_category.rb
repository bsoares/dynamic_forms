class SubCategory < ActiveRecord::Base
  belongs_to :category

  validates :category_id,
    presence: true

  validates :name,
    presence: true,
    length: { within: 1..100 },
    uniqueness: { scope: :category_id }

  validates :slug,
    presence: true,
    length: { within: 1..100 },
    uniqueness: { scope: :category_id }
end
