class List < ApplicationRecord

  belongs_to :user, optional: true
  has_one_attached :list_file
end
