class FriendshipsController < ApplicationController
  helper_method :all
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  # GET /friendships
  # GET /friendships.json
  def index
    @friendships = Friendship.all
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  # POST /friendships
  # POST /friendships.json
  def create
    @friendship = Friendship.new(friendship_params)
  end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    respond_to do |format|
      if @friendship.update(friendship_params)
        format.html { redirect_to @friendship, notice: 'Friendship was successfully updated.' }
        format.json { render :show, status: :ok, location: @friendship }
      else
        format.html { render :edit }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    puts "PARAMS: #{params}"
    Friendship.find(params[:id]).destroy
    url = params[:type] == :sent ? sent_friendships_path : params[:type] == :received ? received_friendships_path : friendships_path
    redirect_to url, notice: 'Friendship was successfully removed.'
  end

  def add_to_friends
    Friendship.create(owner_id: params[:owner_id], friend_id: params[:friend_id], status: params[:status])
    redirect_back fallback_location: users_list_url
  end

  def approve_friendship
    Friendship.find(params[:id]).update(status: :accepted)
    redirect_to friendships_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.fetch(:friendship, {})
    end

end
