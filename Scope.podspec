Pod::Spec.new do |s|
  s.name             = "Scope"
  s.version          = "1.0.0"
  s.summary          = "🌷 Scoping Functions of Kotlin Style for Readable Code"
  s.description      = "🌷 Scoping Functions of Kotlin Style for Readable Code"
  s.homepage         = "https://github.com/hb1love/Scope"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Kim Heebeom" => "heebuma@gmail.com" }
  s.source           = { :git => "https://github.com/hb1love/Scope.git", :tag => s.version.to_s }
  s.social_media_url = "http://happytiger.co.kr"
  
  s.platform         = :ios, '8.0'
  s.swift_version    = '4.2'
  s.requires_arc     = true

  s.source_files     = 'Scope/Classes/**/*'
end
