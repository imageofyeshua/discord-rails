require "test_helper"

class Server::ChannelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @server_channel = server_channels(:one)
  end

  test "should get index" do
    get server_channels_url
    assert_response :success
  end

  test "should get new" do
    get new_server_channel_url
    assert_response :success
  end

  test "should create server_channel" do
    assert_difference("Server::Channel.count") do
      post server_channels_url, params: { server_channel: { name: @server_channel.name, server_id: @server_channel.server_id } }
    end

    assert_redirected_to server_channel_url(Server::Channel.last)
  end

  test "should show server_channel" do
    get server_channel_url(@server_channel)
    assert_response :success
  end

  test "should get edit" do
    get edit_server_channel_url(@server_channel)
    assert_response :success
  end

  test "should update server_channel" do
    patch server_channel_url(@server_channel), params: { server_channel: { name: @server_channel.name, server_id: @server_channel.server_id } }
    assert_redirected_to server_channel_url(@server_channel)
  end

  test "should destroy server_channel" do
    assert_difference("Server::Channel.count", -1) do
      delete server_channel_url(@server_channel)
    end

    assert_redirected_to server_channels_url
  end
end
