#
# Be sure to run `pod lib lint AJPopAlert.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AJPopAlert'
  s.version          = '0.1.0'
  s.summary          = 'Pop Alert to Show Message'
  s.swift_version    = '4.2'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Pop Alert to Show Message with variant type'

  s.homepage         = 'https://github.com/ajijoyo/AJPopAlert'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ajijoyo' => 'self.ajiejoy@gmail.com' }
  s.source           = { :git => 'https://github.com/ajijoyo/AJPopAlert.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'AJPopAlert/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AJPopAlert' => ['AJPopAlert/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'SnapKit', '~> 4.0.1'
  
end
