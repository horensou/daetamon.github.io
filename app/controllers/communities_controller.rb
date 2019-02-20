class CommunitiesController < ApplicationController
  before_action :set_community, only: [:show, :edit, :update, :destroy]

  # GET /communities
  # GET /communities.json
  def index
    
    @search = Community.search do
        fulltext params[:search]
    end
    @communities = @search.results
    
  
    @communities = Community.all.reverse
    
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
  
  end
  impressionist actions: [:show], unique: [:ip_address]
  # GET /communities/1
  # GET /communities/1.json
  def show
    @comm_comments = CommComment.all
  end

  # GET /communities/new
  def new
    @community = Community.new
  end

  # GET /communities/1/edit
  def edit
  end

  # POST /communities
  # POST /communities.json
  def create
    @community = Community.new(community_params)

    respond_to do |format|
      if @community.save
        format.html { redirect_to @community, notice: 'Community was successfully created.' }
        format.json { render :show, status: :created, location: @community }
      else
        format.html { render :new }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communities/1
  # PATCH/PUT /communities/1.json
  def update
    respond_to do |format|
      if @community.update(community_params)
        format.html { redirect_to @community, notice: 'Community was successfully updated.' }
        format.json { render :show, status: :ok, location: @community }
      else
        format.html { render :edit }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/1
  # DELETE /communities/1.json
  def destroy
    @community.destroy
    respond_to do |format|
      format.html { redirect_to communities_url, notice: 'Community was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community
      @community = Community.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_params
      params.require(:community).permit(:title, :content, :image)
    end
    
    def like_toggle
    like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    #좋아요가 눌렸는지 체크
    if like.nil?
      Like.create(user_id: current_user.id, post_id: params[:post_id])
    else
      like.destroy
    end
    redirect_to :back
    end
end
