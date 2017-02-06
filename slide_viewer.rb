require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

def file_image_path
  File.expand_path("../public/images", __FILE__)
end

get "/" do
  pattern = File.join(file_image_path, "*.dzi")
  @files = Dir.glob(pattern).map do |path|
    File.basename(path)
  end
  erb :index
end

get "/:filename" do
  @file = "/images/#{ params[:filename] }"
  erb :virtual_slide
end