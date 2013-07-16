require 'open-uri'
require 'cgi'
require 'json'

class LinksController < ApplicationController
  # GET /links
  # GET /links.json
  def index
    @links = User.find_by_username(current_user.username).links

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @links }
    end
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @link = Link.find_by_title(params[:title])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @link }
    end
  end

  # GET /links/new
  # GET /links/new.json
  def new
    @link = Link.new
    
    if params[:url] != nil
      @title = Link.find(params[:url]).title
      @url = Link.find(params[:url]).url
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @link }
    end
  end

  # GET /links/1/edit
  def edit
    @link = Link.find(params[:id])
  end

  # POST /links
  # POST /links.json
  def create
    params[:link]["user_id"] = current_user.id
    params[:link]["vote"] = 0
    
    @link = Link.new(params[:link])

    respond_to do |format|
      if @link.save
        format.html { redirect_to "/discuss/" + @link.title, notice: 'Link was successfully created.' }
        format.json { render json: @link, status: :created, location: @link }
      else
        format.html { render action: "new" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def createAPI
    @user = User.find_by_authentication_token(params[:auth_token])
    
    url = params[:url]
    title = params[:title]
    
    params = ActionController::Parameters.new({
      link: {
        user_id:@user.id,
        vote: 0,
        content: "",
        url: url,
        title:title,
        private: true
      }
    })
    
    params[:link]["user_id"] = @user.id
    
    @link = Link.new(params[:link])
    
    if @link.save
      render :status=>200, :json=>{status: :created}
    end
  end
  
  def publicize
    @link = Link.find(params[:id])
    if User.find_by_username(@link.user.username).id == current_user.id	
      if params[:method] == "public"
        @link.private = false
      else
        @link.private = true
      end
    
      @link.save
    
      redirect_to "/discuss/" + @link.title
    end
  end
  
  def updateVote
    @link = Link.find(params[:id])
    if params[:updown] == "up"
      @link.vote = @link.vote + 1
      puts @link.vote
    else
      @link.vote = @link.vote - 1
    end    
    @link.save
    
    redirect_to URI::encode("/discuss/" + @link.title)
  end
  
  # PUT /links/1
  # PUT /links/1.json
  def update
    @link = Link.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end  
end
