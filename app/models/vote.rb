class Vote < ActiveRecord::Base
  belongs_to :link, :counter_cache => true
  validates :link, :presence => true

  
end
