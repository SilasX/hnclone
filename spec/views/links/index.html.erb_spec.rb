require 'spec_helper'

describe "links/index.html.erb" do
  context "voting on links" do
    
    before do
      @links = [Factory(:link)]
      assign(:links, @links)  # :links --> @links in view
      render
    end  

    it 'has a vote button' do
      rendered.should have_tag('form', :with => { :action => "/votes", :method => 'post' }) do
        with_tag "input",
          :with => { :name => "vote[link_id]", :value => @links[0].id}
      end
    end
    
    it "displays a vote count" do
      rendered.should have_tag('span#vote_count')
    end
    
    it "displays the correct number of votes" do
      @links[0].votes.create
      render
      rendered.should have_tag('span#vote_count', :text => "1")
    end
    
  end
end
