class Clothing < ApplicationRecord
	mount_uploaders :clothingimages, ClothingimagesUploader
  #acts_as_taggable # Alias for acts_as_taggable_on :tags
  #acts_as_ordered_taggable

  has_secure_token :listing_token
  require 'securerandom'
  SecureRandom.hex(2)

  acts_as_taggable_on :tags

	 def country_name
    country = self.country
    ISO3166::Country[country]
    end

    def currency_name
    currency = self.currency
    ISO3166::Country[currency]
    end

	belongs_to :user
  belongs_to :w
  belongs_to :fashion
  has_many :bookmarks


  extend FriendlyId
  friendly_id :name, use: :slugged

   def should_generate_new_friendly_id?
   name_changed?
  end


    #searchkick locations: [:location]

  def address
    [local_area, town, country_name].compact.join(", ")
  end

  def address_changed?
    local_area_changed? || town_changed? || country_name_changed?
  end

  def search_data
    attributes.merge location: { lat: latitude, lon: longitude }
  end


  def is_bookmarked user
    Bookmark.find_by(user_id: user.id, clothing_id: id)
    
  end





end
