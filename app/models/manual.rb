class Manual < ApplicationRecord
  with_options presence: true do
    validates :job
    validates :heading
    validates :text
  end

  belongs_to :category
end
