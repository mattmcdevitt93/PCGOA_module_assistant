require "application_system_test_case"

class EffectsTest < ApplicationSystemTestCase
  setup do
    @effect = effects(:one)
  end

  test "visiting the index" do
    visit effects_url
    assert_selector "h1", text: "Effects"
  end

  test "creating a Effect" do
    visit effects_url
    click_on "New Effect"

    fill_in "Effect", with: @effect.effect
    click_on "Create Effect"

    assert_text "Effect was successfully created"
    click_on "Back"
  end

  test "updating a Effect" do
    visit effects_url
    click_on "Edit", match: :first

    fill_in "Effect", with: @effect.effect
    click_on "Update Effect"

    assert_text "Effect was successfully updated"
    click_on "Back"
  end

  test "destroying a Effect" do
    visit effects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Effect was successfully destroyed"
  end
end
