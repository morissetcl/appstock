require 'test_helper'

class IndexHomTest < ActionDispatch::IntegrationTest
  test "loads correctly" do
      visit "books"
      assert_equal 200, page.status_code
      assert page.has_content?("Index Books")
    end
end
