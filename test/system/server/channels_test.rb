require "application_system_test_case"

class Server::ChannelsTest < ApplicationSystemTestCase
  setup do
    @server_channel = server_channels(:one)
  end

  test "visiting the index" do
    visit server_channels_url
    assert_selector "h1", text: "Channels"
  end

  test "should create channel" do
    visit server_channels_url
    click_on "New channel"

    fill_in "Name", with: @server_channel.name
    fill_in "Server", with: @server_channel.server_id
    click_on "Create Channel"

    assert_text "Channel was successfully created"
    click_on "Back"
  end

  test "should update Channel" do
    visit server_channel_url(@server_channel)
    click_on "Edit this channel", match: :first

    fill_in "Name", with: @server_channel.name
    fill_in "Server", with: @server_channel.server_id
    click_on "Update Channel"

    assert_text "Channel was successfully updated"
    click_on "Back"
  end

  test "should destroy Channel" do
    visit server_channel_url(@server_channel)
    click_on "Destroy this channel", match: :first

    assert_text "Channel was successfully destroyed"
  end
end
