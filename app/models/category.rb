class Category < ActiveRecord::Base
  validates :name,
    presence: true,
    length: { within: 1..100 },
    uniqueness: true
end
