class Manual < ApplicationRecord
  include Rails.application.routes.url_helpers

  with_options presence: true do
    validates :title
    validates :heading
    validates :text
  end

  belongs_to :category
  has_one_attached :image
end
