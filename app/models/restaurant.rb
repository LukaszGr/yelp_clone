class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, length: { minimum: 3 }, uniqueness: true

  def average_rating
    if reviews.none?
      'N/A'
    else
      reviews.average(:rating)
    end
  end

end
