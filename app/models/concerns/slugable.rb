module Slugable
  extend ActiveSupport::Concern

  included do
    validates :name,
      presence: true,
      length: { within: 1..100 }

    validates :slug,
      presence: true,
      length: { within: 1..100 }

    def to_param
      slug
    end
  end
end
