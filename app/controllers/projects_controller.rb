require 'observer'

class ProjectsController < ApplicationController
  include Observable
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer
    @observers.delete(observer)
  end
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    @projects = Project.where(["title LIKE ?","%#{params[:search]}%"])
    @observers = []

    require 'rss'
    require 'open-uri'
    rss = RSS::Parser.parse('https://www.agileconnection.com/rss-agileconnection')

    rss.items.each do |item|
       @agileTitle = item.title
       @agileLink = item.link
    end

    url = 'https://www.agileconnection.com/rss-agileconnection'
    open(url) do |rss|
      @feed = RSS::Parser.parse(rss)
    #  puts "Title: #{@feed.channel.title}"
      @feed.items.each do |item|
      #  puts "Item: #{item.title}"
        @agile_title = item.title
        @agile_link = item.link
      end
    end

  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    #  @manager = Manager.find(params[:manager_id])
    @project = Project.find(params[:id])
    #  @project = Project.find(project_params)
  end


  def new
    @project = current_manager.projects.build
  end

  def edit
  end



  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.manager_id = current_manager.id
    changed
    notify_observers(self)

    NewProjectCreatedMailer.notify_users.deliver
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
  #  @project = current_manager.projects.build(project_params)
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description, :manager_id)
    end
end

class ProjectDecorator < SimpleDelegator
  def sprint_review
    create.create_sprint_review
  end

  def sprint_retro
  end
end
