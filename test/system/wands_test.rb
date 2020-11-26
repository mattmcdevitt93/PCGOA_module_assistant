require "application_system_test_case"

class WandsTest < ApplicationSystemTestCase
  setup do
    @wand = wands(:one)
  end

  test "visiting the index" do
    visit wands_url
    assert_selector "h1", text: "Wands"
  end

  test "creating a Wand" do
    visit wands_url
    click_on "New Wand"

    fill_in "Description", with: @wand.description
    fill_in "Duration", with: @wand.duration
    fill_in "Effect", with: @wand.effect
    fill_in "Effect", with: @wand.effect_id
    fill_in "Player", with: @wand.player_id
    fill_in "Session", with: @wand.session_id
    fill_in "Uses count", with: @wand.uses_count
    click_on "Create Wand"

    assert_text "Wand was successfully created"
    click_on "Back"
  end

  test "updating a Wand" do
    visit wands_url
    click_on "Edit", match: :first

    fill_in "Description", with: @wand.description
    fill_in "Duration", with: @wand.duration
    fill_in "Effect", with: @wand.effect
    fill_in "Effect", with: @wand.effect_id
    fill_in "Player", with: @wand.player_id
    fill_in "Session", with: @wand.session_id
    fill_in "Uses count", with: @wand.uses_count
    click_on "Update Wand"

    assert_text "Wand was successfully updated"
    click_on "Back"
  end

  test "destroying a Wand" do
    visit wands_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wand was successfully destroyed"
  end
end
