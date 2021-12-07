
Pod::Spec.new do |s|
  s.name             = 'FlutterEngine'
  s.version          = '0.1.0'
  s.summary          = 'A FlutterEngine on ios'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/xx/FlutterEngine'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'guo' => 'applekwork@163.com' }
  s.source       = { :git => "", :tag => "#{s.version}" }
  s.ios.deployment_target = '8.0'
  s.ios.vendored_frameworks = 'App.framework', 'Flutter.framework'
end