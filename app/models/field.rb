class Field < ActiveRecord::Base
  belongs_to :form

  enum field_type:
    [:text_field, :textarea_field, :select_field, :checkbox_field]

  validates :form,
    presence: true

  validates :field_type,
    presence: true

  validates :order,
    presence: true

  validates :name,
    presence: true,
    length: { within: 1..100 }

  scope :ordered, -> { order(:order) }
end
