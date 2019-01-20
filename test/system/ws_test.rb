require "application_system_test_case"

class WsTest < ApplicationSystemTestCase
  setup do
    @w = ws(:one)
  end

  test "visiting the index" do
    visit ws_url
    assert_selector "h1", text: "Ws"
  end

  test "creating a W" do
    visit ws_url
    click_on "New W"

    fill_in "Name", with: @w.name
    click_on "Create W"

    assert_text "W was successfully created"
    click_on "Back"
  end

  test "updating a W" do
    visit ws_url
    click_on "Edit", match: :first

    fill_in "Name", with: @w.name
    click_on "Update W"

    assert_text "W was successfully updated"
    click_on "Back"
  end

  test "destroying a W" do
    visit ws_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "W was successfully destroyed"
  end
end
