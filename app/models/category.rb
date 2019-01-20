class Category < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :w, optional: true

  extend FriendlyId
  friendly_id :name, use: :slugged

   def should_generate_new_friendly_id?
   name_changed?
  end


end
