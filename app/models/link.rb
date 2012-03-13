class Link < ActiveRecord::Base
  validates :url, :presence => true, :uniqueness => true, :format => {:with => URI.regexp}
  validates :title, :presence => true
  
  has_many :votes

  scope :by_vote_count, :order => "votes_count DESC"
        
  def vote_count
    votes.count
  end  
  
end
