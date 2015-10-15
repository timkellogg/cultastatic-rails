class Movie < ActiveRecord::Base
  belongs_to :category
  has_many :reviews

  validate  :picture_size
  mount_uploader :picture, PictureUploader

  def calculate_rating
      total_reviews = self.reviews.count
      sum = 0
      self.reviews.each do |review|
        sum += review.rating
      end
      average = sum / total_reviews
      self.average_rating= average
  end

  def self.search(query)
    where("title like ?", "%#{query}%")
  end

  def sort_reviews
    ordered_reviews = []
  end

  private

    def picture_size
      if picture.size > 2.megabytes
        errors.add(:picture, "should be less than 2MB")
      end
    end
end
