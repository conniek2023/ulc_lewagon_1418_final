class CommunitiesController < ApplicationController
  def index
    @communities = policy_scope(Community).all
  end

  def show
    authorize @community
    @community = Community.find(params[:id])
  end

  def new
    @community = Community.new
    authorize @community
  end

  def create
    @community = current_user.communities.build(community_params)
    authorize @community
    if @community.save
      redirect_to @community
    else
      render :new
    end
  end

  def edit
    @community = Community.find(params[:id])
    authorize @community
  end

  def update
    @community = Community.find(params[:id])
    authorize @community
    if @community.update(community_params)
      redirect_to @community
    else
      render :edit
    end
  end

  def destroy
    @community=Community.find(params[:id])
    authorize @community
    @community.destroy
    # redirect_to , status: :see_other
  end

  private

  def community_params
    params.require(:community).permit(:name, :description, :topic)
  end


end
