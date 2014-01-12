require "rubygems"
gem "opencv"
require "opencv"

image = OpenCV::IplImage.load("sample.jpg")
window = OpenCV::GUI::Window.new("preview")
window.show(image)
OpenCV::GUI::wait_key