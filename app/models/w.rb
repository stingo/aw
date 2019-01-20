class W < ApplicationRecord
	has_ancestry
    has_many :clothings
    belongs_to :user, optional: true

    #admin only
    has_many :fashions
	

 extend FriendlyId
  friendly_id :name, use: :slugged

   def should_generate_new_friendly_id?
   name_changed?
  end
end
