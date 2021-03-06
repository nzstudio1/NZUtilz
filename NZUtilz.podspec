#
# Be sure to run `pod lib lint NZUtilz.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NZUtilz'
  s.version          = '0.1.2'
  s.summary          = 'A collection of base classes shared and used among NZ libraries.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
NZUtilz is a collection of base components such as collection/table view base classes, and utility classes including general purpose, geometry, threading, math, etc.
                       DESC

  s.homepage         = 'https://github.com/nzstudio1/NZUtilz'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Hamidreza Vakilian' => 'hamid@nzstudio.dev' }
  s.source           = { :git => 'https://github.com/nzstudio1/NZUtilz.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'NZUtilz/NZUtilz/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NZUtilz' => ['NZUtilz/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'NSObject-Meta', '~> 0.1.0'
end
