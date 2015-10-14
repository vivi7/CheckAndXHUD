Pod::Spec.new do |s|
  s.name = 'CheckAndXHUD'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'CheckAndXHUD Library for iOS'
  s.homepage = 'https://github.com/vivi7/CheckAndXHUD'
  s.authors = { "Vincenzo Favara" => "vin.favara@gmail.com" }
  s.source = { :git => 'https://github.com/vivi7/CheckAndXHUD.git', :tag => s.version }
  s.source_files   = 'Source/*'
  s.platform     = :ios, "8.1"
  s.frameworks = 'UIKit'
  s.requires_arc = true
end