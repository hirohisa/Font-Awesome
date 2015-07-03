Pod::Spec.new do |s|

  s.name         = "Font-Awesome"
  s.version      = "0.0.1"
  s.summary      = "Use Font Awesome in project written in Swift."
  s.description  = <<-DESC
                   Use Font Awesome in project written in Swift. If you hope to use lastest edition, it is possible by Font-Awesome.
                   DESC

  s.homepage     = "https://github.com/hirohisa/Font-Awesome"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Hirohisa Kawasaki" => "hirohisa.kawasaki@gmail.com" }

  s.source       = { :git => "https://github.com/hirohisa/Font-Awesome.git", :tag => s.version }

  s.source_files = "Font-Awesome/*.swift"
  s.requires_arc = true
  s.ios.deployment_target = '8.0'

end
