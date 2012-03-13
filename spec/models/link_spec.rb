require 'spec_helper'

describe Link do
  
  it 'requires a url' do
    should_not be_valid
    subject.errors[:url].should_not be_empty
  end
  
  it 'requires a title' do
    should_not be_valid
    subject.errors[:title].should_not be_empty
  end
  
  it 'does not allow duplicate urls' do
    Link.create! :title => "dont care", :url => "http://devbootcamp.com"
    l = Link.new :title => "dont care", :url => "http://devbootcamp.com"
    l.should_not be_valid
    l.errors[:url].should_not be_empty
  end
  
  it 'has a valid url' do
    l = Link.new :title => "dont care", :url => "123456"
    l.should_not be_valid
  end
  
  context "with votes" do
    before(:each) do
      @l = Link.create :title => "dont care", :url => "http://google.com"
    end
    
    # it "has a number of votes" do
    #   @l.votes.count.should be_zero
    #   @l.vote_count.should == 0
    # end
    # 
    # it 'can be upvoted' do
    #   expect {
    #     @l.votes.create
    #   }.to change(@l, :vote_count).by(1)
    # 
    # end
    
    it "can be sorted by vote count" do
      @links = FactoryGirl.create_list(:link,3)
      Vote.create!(:link => @links[0])
      5.times do
        Vote.create!(:link => @links[1])
      end
      2.times do
        Vote.create!(:link => @links[2])
      end
      links = Link.order_by_vote
      links.first.vote_count.should == 5
      links.last.vote_count.should == 0
    end
    
  
  end
end
