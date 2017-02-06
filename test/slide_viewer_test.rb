ENV["RACK_ENV"] = "test"

require "minitest/autorun"
require "rack/test"

require_relative "../slide_viewer"

class SlideViewerTest < Minitest::Test 
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get "/"

    assert_equal 200, last_response.status

  end

end