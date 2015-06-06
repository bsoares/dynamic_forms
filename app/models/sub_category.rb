class SubCategory < ActiveRecord::Base
  include Slugable

  belongs_to :category
  has_many :forms

  validates :category_id,
    presence: true

  validates :name,
    uniqueness: { scope: :category_id }

  validates :slug,
    uniqueness: { scope: :category_id }

  scope :preload_options, -> { preload(forms: { fields: :options }) }
end
