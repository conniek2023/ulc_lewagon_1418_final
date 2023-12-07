class CommunitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  skip_after_action :verify_policy_scoped, only: :index
  def index
    if params[:filter].nil?
      @communities = policy_scope(Community).all
    else
      @communities = policy_scope(Community).where(topic: params[:filter])
    end
  end

  def show
    @community = Community.find(params[:id])
    @events = @community.events # => [event1 , ...]
    authorize @community
    # @current_user = current_user
  end

  # def new
  #   @community = Community.new
  #   authorize @community
  # end

  def create
    @community = current_user.communities.build(community_params)
    authorize @community
    if @community.save
      redirect_to @community
    else
      render :new
    end
  end

  # def edit
  #   @community = Community.find(params[:id])
  #   authorize @community
  # end

  def update
    @community = Community.find(params[:id])
    authorize @community
    if @community.update(community_params)
      redirect_to @community
    else
      render :update
    end
  end

  def destroy
    @community=Community.find(params[:id])
    authorize @community
    @community.destroy
    redirect_to communities_path, status: :see_other
  end

  private

  def community_params
    params.require(:community).permit(:name, :description, :topic)
  end


end
