require 'test_helper'

class WandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wand = wands(:one)
  end

  test "should get index" do
    get wands_url
    assert_response :success
  end

  test "should get new" do
    get new_wand_url
    assert_response :success
  end

  test "should create wand" do
    assert_difference('Wand.count') do
      post wands_url, params: { wand: { description: @wand.description, duration: @wand.duration, effect: @wand.effect, effect_id: @wand.effect_id, player_id: @wand.player_id, session_id: @wand.session_id, uses_count: @wand.uses_count } }
    end

    assert_redirected_to wand_url(Wand.last)
  end

  test "should show wand" do
    get wand_url(@wand)
    assert_response :success
  end

  test "should get edit" do
    get edit_wand_url(@wand)
    assert_response :success
  end

  test "should update wand" do
    patch wand_url(@wand), params: { wand: { description: @wand.description, duration: @wand.duration, effect: @wand.effect, effect_id: @wand.effect_id, player_id: @wand.player_id, session_id: @wand.session_id, uses_count: @wand.uses_count } }
    assert_redirected_to wand_url(@wand)
  end

  test "should destroy wand" do
    assert_difference('Wand.count', -1) do
      delete wand_url(@wand)
    end

    assert_redirected_to wands_url
  end
end
