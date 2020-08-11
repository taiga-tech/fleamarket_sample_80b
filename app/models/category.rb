class Category < ApplicationRecord
  has_many :items#, depenedent: :destroy
end
