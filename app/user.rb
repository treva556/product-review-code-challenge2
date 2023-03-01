class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews
  
    def reviews
      Review.where(user_id: self.id)
    end
  
    def products
      self.reviews.map{|review| review.product}.uniq
    end
  
    def favorite_product
      self.reviews.order(star_rating: :desc).first.product
    end
  
    def remove_reviews(product)
      self.reviews.where(product_id: product.id).destroy_all
    end
end