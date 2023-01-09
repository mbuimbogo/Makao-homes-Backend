class Seller < User
    has_many :properties, dependent: :destroy
    has_many :reviews
    has_many :comments 
    
    validates :username, presence: true
    validates :password, length: { in: 6..20 }, presence: true
   
end
