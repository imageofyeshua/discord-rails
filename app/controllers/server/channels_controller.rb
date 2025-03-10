class Server::ChannelsController < ApplicationController
  before_action :set_server_channel, only: %i[ show edit update destroy ]

  # GET /server/channels or /server/channels.json
  def index
    @server_channels = Server::Channel.all
  end

  # GET /server/channels/1 or /server/channels/1.json
  def show
  end

  # GET /server/channels/new
  def new
    @server_channel = Server::Channel.new
  end

  # GET /server/channels/1/edit
  def edit
  end

  # POST /server/channels or /server/channels.json
  def create
    @server_channel = Server::Channel.new(server_channel_params)

    respond_to do |format|
      if @server_channel.save
        format.html { redirect_to @server_channel, notice: "Channel was successfully created." }
        format.json { render :show, status: :created, location: @server_channel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @server_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /server/channels/1 or /server/channels/1.json
  def update
    respond_to do |format|
      if @server_channel.update(server_channel_params)
        format.html { redirect_to @server_channel, notice: "Channel was successfully updated." }
        format.json { render :show, status: :ok, location: @server_channel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @server_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /server/channels/1 or /server/channels/1.json
  def destroy
    @server_channel.destroy!

    respond_to do |format|
      format.html { redirect_to server_channels_path, status: :see_other, notice: "Channel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_server_channel
      @server_channel = Server::Channel.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def server_channel_params
      params.expect(server_channel: [ :name, :server_id ])
    end
end
