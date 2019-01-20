require 'test_helper'

class WsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @w = ws(:one)
  end

  test "should get index" do
    get ws_url
    assert_response :success
  end

  test "should get new" do
    get new_w_url
    assert_response :success
  end

  test "should create w" do
    assert_difference('W.count') do
      post ws_url, params: { w: { name: @w.name } }
    end

    assert_redirected_to w_url(W.last)
  end

  test "should show w" do
    get w_url(@w)
    assert_response :success
  end

  test "should get edit" do
    get edit_w_url(@w)
    assert_response :success
  end

  test "should update w" do
    patch w_url(@w), params: { w: { name: @w.name } }
    assert_redirected_to w_url(@w)
  end

  test "should destroy w" do
    assert_difference('W.count', -1) do
      delete w_url(@w)
    end

    assert_redirected_to ws_url
  end
end
