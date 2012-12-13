class NewsController < ApplicationController
  def index
    @links = Link.order('id DESC') # gives us all, but in the order we want, you can do name url, ASC, whatever
  end
end