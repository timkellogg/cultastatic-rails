class Category < ActiveRecord::Base
  has_many :movies

  validates :name, :presence => true,
                  :length => {:maximum => 20}

  
end
