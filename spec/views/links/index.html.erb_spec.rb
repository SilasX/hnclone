require 'spec_helper'

describe "links/index.html.erb" do
  context "voting on links" do
    
    before do
      @links = [Factory(:link), Factory(:link), Factory(:link)] 
      assign(:links, @links)  # :links --> @links in view
      render
    end  

    it 'has a vote button' do
      rendered.should have_tag('form', :with => { :action => "/votes", :method => 'post' }) do
        with_tag "input",
          :with => { :name => "vote[link_id]", :value => @links[0].id}
      end
    end
    
    it 'displays number of votes' do
      rendered.should have_tag('span.vote_count', :text => @links[0].votes.count )
    end
    
    it 'can be reordered by vote count' do
      visit(links_path)
      @links.last.votes.create
      click_link 'order by top voted'
      response.should have_tag('span.vote_count:first-of-type', :text => "1")
    end
  end
end
