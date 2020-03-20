Pod::Spec.new do |s|
  s.name             = "Scope"
  s.version          = "1.2.0"
  s.summary          = "🌷 Scoping Functions of Kotlin Style for Readable Code"
  s.homepage         = "https://github.com/hb1love/Scope"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Kim Heebeom" => "heebuma@gmail.com" }
  s.social_media_url = "http://happytiger.co.kr"
  s.source           = { :git => "https://github.com/hb1love/Scope.git", :tag => s.version.to_s }
  s.source_files     = 'Scope/Classes/**/*'
  s.requires_arc     = true
  
  s.ios.deployment_target = "8.0"
end
