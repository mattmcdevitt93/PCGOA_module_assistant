require "application_system_test_case"

class GameSessionsTest < ApplicationSystemTestCase
  setup do
    @game_session = game_sessions(:one)
  end

  test "visiting the index" do
    visit game_sessions_url
    assert_selector "h1", text: "Game Sessions"
  end

  test "creating a Game session" do
    visit game_sessions_url
    click_on "New Game Session"

    fill_in "Effect buffer", with: @game_session.effect_buffer
    fill_in "Effects used", with: @game_session.effects_used
    check "Lock player pages" if @game_session.lock_player_pages
    fill_in "Number of players", with: @game_session.number_of_players
    fill_in "Owner", with: @game_session.owner
    fill_in "Passcode", with: @game_session.passcode
    check "Player display mode" if @game_session.player_display_mode
    fill_in "Session name", with: @game_session.session_name
    click_on "Create Game session"

    assert_text "Game session was successfully created"
    click_on "Back"
  end

  test "updating a Game session" do
    visit game_sessions_url
    click_on "Edit", match: :first

    fill_in "Effect buffer", with: @game_session.effect_buffer
    fill_in "Effects used", with: @game_session.effects_used
    check "Lock player pages" if @game_session.lock_player_pages
    fill_in "Number of players", with: @game_session.number_of_players
    fill_in "Owner", with: @game_session.owner
    fill_in "Passcode", with: @game_session.passcode
    check "Player display mode" if @game_session.player_display_mode
    fill_in "Session name", with: @game_session.session_name
    click_on "Update Game session"

    assert_text "Game session was successfully updated"
    click_on "Back"
  end

  test "destroying a Game session" do
    visit game_sessions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game session was successfully destroyed"
  end
end
