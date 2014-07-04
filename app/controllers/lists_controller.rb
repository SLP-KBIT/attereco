class ListsController < ApplicationController
  def index
    @Project = Project.all
  end
  def lists
    @Project = Project.all
  end
  def creat
    
  end
end
