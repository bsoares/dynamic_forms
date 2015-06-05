class Field < ActiveRecord::Base
  belongs_to :form
  has_many :options

  enum field_type:
    [:text_field, :textarea_field, :select_field, :checkbox_field]

  MULTI_SELECTION_TYPES = [:select_field, :checkbox_field]

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

  def multi_selection?
    return false if field_type.nil?
    MULTI_SELECTION_TYPES.include?(field_type.to_sym)
  end
end
