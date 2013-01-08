class Asset < ActiveRecord::Base
   belongs_to :user
   attr_accessible :photo
   has_attached_file :photo, :styles => { :small => "150x150>" }
end
