class Restaurant < ApplicationRecord



  has_many :reviews, dependent: :destroy
  validates :name, length: { minimum: 3 }, uniqueness: true
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def average_rating
    if reviews.none?
      'N/A'
    else
      reviews.average(:rating)
    end
  end

end
