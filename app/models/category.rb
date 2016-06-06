class Category < ActiveRecord::Base
    has_and_belongs_to_many :listings
    
    def self.search(search)
      if search
        self.where("title like ?", "%#{search}%")
      else
        self.all
      end
    end
end
