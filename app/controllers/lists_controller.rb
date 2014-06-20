class ListsController < ApplicationController
  def index
    @Project =  Project.first
  end
  def lists
  end
end
