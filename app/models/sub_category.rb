class SubCategory < ActiveRecord::Base
  include Slugable

  belongs_to :category

  validates :category_id,
    presence: true

  validates :name,
    uniqueness: { scope: :category_id }

  validates :slug,
    uniqueness: { scope: :category_id }
end
