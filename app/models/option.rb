class Option < ActiveRecord::Base
  belongs_to :field

  validates :field,
    presence: true

  validates :name,
    presence: true,
    length: { within: 1..100 }
end
