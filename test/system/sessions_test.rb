require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  setup do
    @session = sessions(:one)
  end

  test "visiting the index" do
    visit sessions_url
    assert_selector "h1", text: "Sessions"
  end

  test "creating a Session" do
    visit sessions_url
    click_on "New Session"

    fill_in "Effect buffer", with: @session.effect_buffer
    fill_in "Effects used", with: @session.effects_used
    check "Lock player pages" if @session.lock_player_pages
    fill_in "Number of players", with: @session.number_of_players
    fill_in "Owner", with: @session.owner
    fill_in "Passcode", with: @session.passcode
    check "Player display mode" if @session.player_display_mode
    fill_in "Session name", with: @session.session_name
    click_on "Create Session"

    assert_text "Session was successfully created"
    click_on "Back"
  end

  test "updating a Session" do
    visit sessions_url
    click_on "Edit", match: :first

    fill_in "Effect buffer", with: @session.effect_buffer
    fill_in "Effects used", with: @session.effects_used
    check "Lock player pages" if @session.lock_player_pages
    fill_in "Number of players", with: @session.number_of_players
    fill_in "Owner", with: @session.owner
    fill_in "Passcode", with: @session.passcode
    check "Player display mode" if @session.player_display_mode
    fill_in "Session name", with: @session.session_name
    click_on "Update Session"

    assert_text "Session was successfully updated"
    click_on "Back"
  end

  test "destroying a Session" do
    visit sessions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Session was successfully destroyed"
  end
end
