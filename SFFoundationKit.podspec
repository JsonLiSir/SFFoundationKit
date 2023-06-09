

Pod::Spec.new do |s|
  s.name             = 'SFFoundationKit'
  s.version          = '1.0'
  s.summary          = 'A short description of SFFoundationKit.'


  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/JsonLiSir/SFFoundationKit.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '1026694246@qq.com' => '1026694246@qq.com' }
  s.source           = { :git => 'https://github.com/JsonLiSir/SFFoundationKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'SFFoundationKit/Classes/**/*'

end
