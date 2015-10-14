class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :rating, :presence => true,
                     :numericality => { greater_than_or_equal: 0, less_than_or_equal_to: 5, only_integer: true }
end
