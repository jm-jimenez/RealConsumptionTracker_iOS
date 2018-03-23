# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

def shared_pods
    pod 'Alamofire', '~> 4.5'
    pod 'AlamofireObjectMapper', '~> 5.0'
    pod 'SVProgressHUD', '~> 2.2.5'
    pod 'KeychainAccess', '~> 3.1'
    pod 'PopupDialog', '~> 0.7'
end

target 'pro' do
  use_frameworks!
  shared_pods
end

target 'dev' do
    use_frameworks!
    shared_pods
end
