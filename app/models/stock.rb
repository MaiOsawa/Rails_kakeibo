class Stock < ApplicationRecord
    
    validates :category, presence: true
    validates :amount, presence: true
    
end
