Pod::Spec.new do |s|
  s.name             = "ios-extend"
  s.version          = "0.1.0"
  s.summary          = "some usefull objective-c categories for ios development"

  s.description      = <<-DESC
                       DESC
  s.homepage         = "https://github.com/brivio/ios-extend"
  s.license          = 'MIT'
  s.author           = { "brivio" => "brivio@qq.com" }
  s.source           = { :git => "https://github.com/brivio/ios-extend.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'source/*'
  s.frameworks='WebKit'
  s.dependency 'MBProgressHUD', '~> 0.9.2'
  s.dependency 'SDWebImage', '~> 3.7.3'
  s.dependency 'UITextView+Placeholder', '~> 1.1.0'
  s.dependency 'Masonry', '~> 0.6.4'
  s.dependency 'SSKeychain', '~> 1.3.1'
end
