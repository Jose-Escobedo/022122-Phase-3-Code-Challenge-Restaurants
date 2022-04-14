class Restaurant < ActiveRecord::Base
    has_many :reviews
    has_many :customers, through: :reviews

    def self.fanciest
        self.order(:price).last
    end

    def all_reviews
        restaurant_array = []
        self.reviews.each do |review|
            restaurant_array << "Review for #{self.name} by #{Customer.find(review.customer_id).first_name} #{Customer.find(review.customer_id).last_name}: #{review.star_rating} stars."
        end
        restaurant_array
    end

end