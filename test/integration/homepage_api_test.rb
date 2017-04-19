require 'test_helper'


class AppStock::APITest < ActiveSupport::TestCase
   include Rack::Test::Methods

   def app
    Appstock::API
   end

  test "homepage loads correctly" do
      get "api/v1/books"
      save_and_open_screenshot

    end


end
