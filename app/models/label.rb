class Label < ActiveRecord::Base

<<<<<<< HEAD
   has_many :labelings
   belongs_to :labelable, polymorphic: true
   has_many :topics, through: :labelings, source: :labelable, source_type: :Topic
   has_many :posts, through: :labelings, source: :labelable, source_type: :Post


=======
  has_many :labelings
  has_many :topics, through: :labelings, source: :labelable, source_type: :Topic
  has_many :posts, through: :labelings, source: :labelable, source_type: :Post
>>>>>>> Labels_checkout

  def self.update_labels(label_string)
 # #24
     return Label.none if label_string.blank?

 # #25
     label_string.split(",").map do |label|
       Label.find_or_create_by(name: label.strip)
     end
   end

end
