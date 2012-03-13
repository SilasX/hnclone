require 'spec_helper'

describe "links/index.html.erb" do
  context "voting on links" do
    
    before do
      @links = FactoryGirl.create_list(:link,3)
      Vote.create!(:link => @links[0])
      5.times do
        Vote.create!(:link => @links[1])
      end
      2.times do
        Vote.create!(:link => @links[2])
      end
      (:links, @links)
      render
    end  
    
    it 'has a vote button' do
      rendered.should have_tag('form', :with => { :action => "/votes", :method => 'post' }) do
        with_tag "input",
          :with => { :name => "vote[link_id]", :value => @links[0].id}
      end
    end
    
    it 'displays current vote count' do
      Link.all.each {|x| puts "#{x.inspect} ---- #{x.vote_count}"}
      rendered.should =~ /5/
      rendered.should =~ /2/
      rendered.should =~ /1/
    end
  end
end
