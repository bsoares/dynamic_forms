class FieldDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def field_type_translated
    t("field_types.#{field_type}")
  end
end
