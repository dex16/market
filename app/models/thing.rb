class Thing < ApplicationRecord
  belongs_to :user
  has_many :black_lists, dependent: :destroy
end
