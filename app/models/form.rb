class Form < ActiveRecord::Base
  belongs_to :sub_category
  has_many :fields

  validates :sub_category,
    presence: true

  validates :name,
    presence: true,
    length: { within: 1..100 }
end
