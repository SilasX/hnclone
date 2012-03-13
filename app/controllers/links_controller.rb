class LinksController < ApplicationController
  def index
    if params[:order] == 'votes'
      @links = Link.by_vote_count
    else
      @links = Link.all
    end
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])
    
    if @link.save
      redirect_to links_path, :notice => "Link added"
    else
      render "new"
    end
  end
end
