class Listing < ActiveRecord::Base

    validates_presence_of :title, :link, :description, :deadline, :organization, :salary, :wage
    validates :salary, numericality: { greater_than_or_equal_to: 40000}, unless: "salary == 0"
    validate :deadline_greater_than_today
   
    has_and_belongs_to_many :categories
    belongs_to :city
    
    def deadline_greater_than_today
        if Date.today > self.deadline
            errors.add(:deadline, "Deadline must be greater than today's date")
        end
    end
    
    def self.search(search)
      if search
        self.where("title like ?", "%#{search}%")
      else
        self.all
      end
    end
 
end
