class Movie < ActiveRecord::Base
  belongs_to :category
  has_many :reviews

  validate  :picture_size
  mount_uploader :picture, PictureUploader

  private
    def picture_size
      if picture.size > 2.megabytes
        errors.add(:picture, "should be less than 2MB")
      end
    end
end
