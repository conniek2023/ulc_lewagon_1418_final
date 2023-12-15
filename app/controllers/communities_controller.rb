class CommunitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  skip_after_action :verify_policy_scoped, only: :index
  def index
    if params[:filter].nil?
      @communities = policy_scope(Community).all
    else
      @communities = policy_scope(Community).where(topic: params[:filter])
    end
    @community = Community.new
  end

  def show
    @community = Community.find(params[:id])
    @events = @community.events # => [event1 , ...]
    authorize @community
    @event = Event.new
    @event.community = @community
    # @current_user = current_user
  end

  def new
    @community = Community.new
    authorize @community
  end

  def create
    # raise
    # @community = current_user.communities.build(community_params)
    @community = Community.new(community_params)
    @community.user = current_user
    authorize @community
    if @community.save
      redirect_to @community, status: 303
    else
      render 'communities/index', status: 422
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
      # @community.photo=params[:photo]
      redirect_to @community, status: 303
    else
      # render :update
      render 'communities/show', status: 422
    end
  end

  def destroy
    # raise
    @community=Community.find(params[:id])
    @community.destroy
    authorize @community
    redirect_to communities_path, status: :see_other
  end

  private

  def community_params
    params.require(:community).permit(:name, :description, :topic, :photo)
  end


end
