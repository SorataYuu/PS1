Pod::Spec.new do |s|
  s.name             = 'DataStructures'
  s.version          = '0.1.0'
  s.summary          = 'Stack and Queue ADTs'

  s.description      = <<-DESC
  Reusable Data Structures for Stack and Queue
                       DESC

  s.homepage         = 'https://bitbucket.org/SorataYuu/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jeremy Jee' => 'e0003848@u.nus.edu' }
  s.source           = { :git => 'https://SorataYuu@bitbucket.org/cs3217/2017-ps1-a0139963n.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files = 'DataStructures/*.swift'

end
