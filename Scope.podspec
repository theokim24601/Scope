Pod::Spec.new do |s|
  s.name             = "Scope"
  s.version          = "2.0.0"
  s.summary          = "🌷 Scoping Functions of Kotlin Style for Readable Code"
  s.homepage         = "https://github.com/hb1love/Scope"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Kim Heebeom" => "heebuma@gmail.com" }
  s.source           = { :git => "https://github.com/hb1love/Scope.git", :tag => s.version.to_s }
  s.source_files     = 'Source/*.swift'

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.tvos.deployment_target = "9.0"
  s.watchos.deployment_target = "2.0"

  s.swift_versions = ['5.1', '5.2']
end
