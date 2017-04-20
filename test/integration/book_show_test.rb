require 'test_helper'

class BookShowTest < ActionDispatch::IntegrationTest
  test "loads correctly" do
      visit "books/1"
      assert_equal 200, page.status_code
      assert page.has_content?("Previous Stock")
    end
  test "form is not filled" do
      visit "books/1"
      click_button "Update stock"
      assert_equal 200, page.status_code
    end
  test "update stock" do
      visit "books/1"
      fill_in "flow_newQuantity", with: "111"
      click_button "Update stock"
      assert_equal 200, page.status_code
      assert page.has_content?("111")
    end
end
