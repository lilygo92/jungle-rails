class Category < ApplicationRecord
  
  validates :name, length: {minimum: 3}

  has_many :products

end
