class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews
  
    def leave_review(user, star_rating, comment)
      review = Review.create(user_id: user.id, product_id: self.id, star_rating: star_rating, comment: comment)
      self.reviews << review
      user.reviews << review
    end
  
    def print_all_reviews
      self.reviews.each do |review|
        review.print_review
      end
    end
  
    def average_rating
      self.reviews.average(:star_rating)
    end
  
    def users
      self.reviews.map{|review| review.user}.uniq
    end
end