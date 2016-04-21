Pod::Spec.new do |s|
  s.name             = "SlotLabel"
  s.version          = "0.1.1"
  s.summary          = "A slot machine inspired, UIKit based class that was made to be animated."

  s.description      = <<-DESC
    SlotLabel is meant to be a drop-in replacement for a UILabel, with one key difference - it was
    made to be animated! The developer interface consists of override properties for configuring
    the label to fit your exact needs, as well as simple to use one liners that will animate your
    label to the string you specify. Out of the box the you can customize the SlotLabel font, text
    color, animation speed, and many of the other options you would expect out of any UILabel
    drop-in replacement.
                       DESC

  s.homepage         = "https://github.com/pinnrepo/SlotLabel"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "David Westerhoff" => "dmwesterhoff@gmail.com" }
  s.source           = { :git => "https://github.com/pinnrepo/SlotLabel.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'SlotLabel/*'
  s.frameworks = 'UIKit'
end
