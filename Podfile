
platform :ios, :deployment_target => "9.0"

def swift_pods
    use_frameworks!
    pod 'SnapKit', '4.0.0'
    pod 'Context', :path => 'LocalPods/Context' 
    pod 'DogFeature', :path => 'LocalPods/DogFeature' 
    pod 'CatFeature', :path => 'LocalPods/CatFeature'
    pod 'HomeFeature', :path => 'LocalPods/HomeFeature'
end

def testing_pods
    use_frameworks!
    pod 'Nimble'
end

target 'CleanUITest' do
xcodeproj 'CleanUITest'
    swift_pods
end

target 'CleanUITestUITests' do
    testing_pods
end

workspace 'CleanUITest.xcworkspace'




