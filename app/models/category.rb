class Category < ActiveRecord::Base
  include Slugable

  has_many :sub_categories

  validates :name,
    uniqueness: true

  validates :slug,
    uniqueness: true
end
