Pod::Spec.new do |s|
  s.name             = "SlotLabel"
  s.version          = "0.1.0"
  s.summary          = "A short description of SlotLabel."

  s.description      = <<-DESC
                       DESC

  s.homepage         = "https://github.com/<GITHUB_USERNAME>/SlotLabel"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "David Westerhoff" => "dmwesterhoff@gmail.com" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/SlotLabel.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'SlotLabel/*'
  s.frameworks = 'UIKit'
end
