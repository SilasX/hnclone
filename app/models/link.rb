class Link < ActiveRecord::Base
  validates :url, :presence => true, :uniqueness => true, :format => {:with => URI.regexp}
  validates :title, :presence => true
  
  has_many :votes
  
  scope :ordered, {}
  
  def vote_count
    votes.count
  end
  
  def self.order_by_vote
    # refactor this later to optimize database counting
    # Link.left_join(:votes).group(:link_id).order("COUNT(link_id) DESC")
    Link.all.sort_by {|n| n.vote_count}.reverse
  end
  
end
