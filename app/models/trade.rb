class Trade < ApplicationRecord
  belongs_to :user1
  belongs_to :user2
  belongs_to :thing1
  belongs_to :thing2
end
