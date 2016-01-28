class Restaurant < ActiveRecord::Base

  has_many :menu_item_types
  has_many :menu_items
  
  has_many :cuisines

  accepts_nested_attributes_for :menu_item_types, :reject_if => :all_blank, :allow_destroy => true

  accepts_nested_attributes_for :menu_items, :reject_if => :all_blank, :allow_destroy => true

  accepts_nested_attributes_for :cuisines, :reject_if => :all_blank, :allow_destroy => true


  def full_street_address
   "#{address1}, #{address2}, #{city}, #{state} #{zip}"
  end 

  geocoded_by :full_street_address, :latitude  => :latitude, :longitude => :longitude

  after_validation :geocode, if: ->(obj){ obj.address1.present? and obj.address1_changed? }

end
